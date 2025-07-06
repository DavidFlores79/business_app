import 'package:business_app/core/errors/failures.dart';
import 'package:business_app/features/product/domain/entities/category_entity.dart';
import 'package:business_app/features/product/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class GetCategoriesUseCase {
  final ProductRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<Either<Failure, List<CategoryEntity>>> call(int page, int pageSize) {
    return repository.getCategories(page, pageSize);
  }
}
