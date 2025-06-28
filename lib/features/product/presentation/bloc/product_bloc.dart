import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_event.dart';
import 'product_state.dart';
import '../../domain/usecases/get_products_usecase.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase getProducts;
  int page = 1;
  final int pageSize = 10;
  bool isLoadingMore = false;

  ProductBloc(this.getProducts) : super(ProductInitial()) {
    on<LoadInitialProducts>(_onLoadInitial);
    on<LoadMoreProducts>(_onLoadMore);
  }

  Future<void> _onLoadInitial(LoadInitialProducts event, Emitter<ProductState> emit) async {
    page = 1;
    emit(ProductLoading());

    final result = await getProducts(page, pageSize);
    result.fold(
      (error) => emit(ProductError(error)),
      (products) => emit(ProductLoaded(products: products, hasMore: products.length == pageSize)),
    );
  }

  Future<void> _onLoadMore(LoadMoreProducts event, Emitter<ProductState> emit) async {
    if (isLoadingMore || state is! ProductLoaded) return;

    isLoadingMore = true;
    page++;

    final result = await getProducts(page, pageSize);
    result.fold(
      (error) => {}, // opcional: emitir ProductError temporal
      (products) {
        final current = (state as ProductLoaded).products;
        emit(ProductLoaded(products: [...current, ...products], hasMore: products.length == pageSize));
      },
    );
    isLoadingMore = false;
  }
}