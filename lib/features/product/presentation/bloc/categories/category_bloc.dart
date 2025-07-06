import 'package:business_app/features/product/domain/usecases/get_categories_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategoriesUseCase getCategories;
  int page = 1;
  final int pageSize = 10;
  bool isLoadingMore = false;

  CategoryBloc(this.getCategories) : super(CategoryInitial()) {
    on<LoadInitialCategories>(_onLoadInitial);
    on<LoadMoreCategories>(_onLoadMore);
  }

  Future<void> _onLoadInitial(
    LoadInitialCategories event,
    Emitter<CategoryState> emit,
  ) async {
    page = 1;
    emit(CategoryLoading());

    final result = await getCategories(page, pageSize);
    result.fold(
      (failure) => emit(CategoryError(failure.message)),
      (categories) => emit(
        CategoryLoaded(
          categories: categories,
          hasMore: categories.length == pageSize,
        ),
      ),
    );
  }

  Future<void> _onLoadMore(
    LoadMoreCategories event,
    Emitter<CategoryState> emit,
  ) async {
    if (isLoadingMore || state is! CategoryLoaded) return;

    isLoadingMore = true;
    page++;

    final result = await getCategories(page, pageSize);
    result.fold((failure) => emit(CategoryError(failure.message)), (
      categories,
    ) {
      final current = (state as CategoryLoaded).categories;
      emit(
        CategoryLoaded(
          categories: [...current, ...categories],
          hasMore: categories.length == pageSize,
        ),
      );
    });
    isLoadingMore = false;
  }
}
