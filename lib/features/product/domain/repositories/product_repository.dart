import 'package:business_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/category_entity.dart';
import '../entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts(
    int page,
    int pageSize,
  );

  Future<Either<Failure, List<CategoryEntity>>> getCategories(
    int page,
    int pageSize,
  );
}
