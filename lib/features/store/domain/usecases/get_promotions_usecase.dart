import 'package:business_app/core/errors/failures.dart';
import 'package:business_app/features/store/domain/repositories/promotion_repository.dart';
import 'package:dartz/dartz.dart';
import '../entities/promotion_entity.dart';

class GetPromotionsUseCase {
  final PromotionRepository repository;

  GetPromotionsUseCase(this.repository);

  Future<Either<Failure, List<PromotionEntity>>> call(int page, int pageSize) {
    return repository.getPromotions(page, pageSize);
  }
}
