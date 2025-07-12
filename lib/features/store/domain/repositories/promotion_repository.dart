import 'package:business_app/core/errors/failures.dart';
import 'package:business_app/features/store/domain/entities/promotion_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PromotionRepository {
  Future<Either<Failure, PromotionEntity>> getPromotionById(String id);

  Future<Either<Failure, List<PromotionEntity>>> getPromotions(
    int page,
    int pageSize,
  );
}
