import 'package:business_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<Either<Failure, List<ProductEntity>>> call(int page, int pageSize) {
    return repository.getProducts(page, pageSize);
  }
}
