import 'package:business_app/core/errors/failures.dart';
import 'package:business_app/features/product/domain/entities/category_entity.dart';
import 'package:business_app/features/product/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/rendering.dart';

import '../../../../core/errors/failure_maper.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource datasource;

  ProductRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts(
    int page,
    int pageSize,
  ) async {
    try {
      final products = await datasource.getProducts(
        page: page,
        pageSize: pageSize,
      );
      debugPrint('Products fetched: ${products.length}');

      return Right(
        products
            .map(
              (product) => ProductEntity(
                id: product.id ?? '',
                name: product.name ?? '',
                price: product.price ?? 0,
                image: product.image ?? '',
                categoryName: product.category?.name ?? '',
                description: product.description ?? '',
                rating: product.rating ?? 0.0,
              ),
            )
            .toList(),
      );
    } on Exception catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories(
    int page,
    int pageSize,
  ) async {
    try {
      final categories = await datasource.getCategories(
        page: page,
        pageSize: pageSize,
      );

      debugPrint('Categories fetched: ${categories.length}');

      return Right(
        categories
            .map(
              (category) => CategoryEntity(
                id: category.id ?? '',
                name: category.name ?? '',
                image: category.image ?? '',
              ),
            )
            .toList(),
      );
    } on Exception catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
