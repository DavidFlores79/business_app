import 'package:flutter_bloc/flutter_bloc.dart';
import 'promotion_event.dart';
import 'promotion_state.dart';
import '../../domain/usecases/get_promotions_usecase.dart';

class PromotionBloc extends Bloc<PromotionEvent, PromotionState> {
  final GetPromotionsUseCase getPromotions;
  int page = 1;
  final int pageSize = 10;
  bool isLoadingMore = false;

  PromotionBloc(this.getPromotions) : super(PromotionInitial()) {
    on<LoadInitialPromotions>(_onLoadInitial);
    on<LoadMorePromotions>(_onLoadMore);
  }

  Future<void> _onLoadInitial(
    LoadInitialPromotions event,
    Emitter<PromotionState> emit,
  ) async {
    page = 1;
    emit(PromotionLoading());

    final result = await getPromotions(page, pageSize);
    result.fold(
      // (error) => emit(PromotionError(error)),
      (failure) => emit(PromotionError(failure.message)),
      (promotions) => emit(
        PromotionLoaded(
          promotions: promotions,
          hasMore: promotions.length == pageSize,
        ),
      ),
    );
  }

  Future<void> _onLoadMore(
    LoadMorePromotions event,
    Emitter<PromotionState> emit,
  ) async {
    if (isLoadingMore || state is! PromotionLoaded) return;

    isLoadingMore = true;
    page++;

    final result = await getPromotions(page, pageSize);
    result.fold((failure) => emit(PromotionError(failure.message)), (
      promotions,
    ) {
      final current = (state as PromotionLoaded).promotions;
      emit(
        PromotionLoaded(
          promotions: [...current, ...promotions],
          hasMore: promotions.length == pageSize,
        ),
      );
    });
    isLoadingMore = false;
  }
}
