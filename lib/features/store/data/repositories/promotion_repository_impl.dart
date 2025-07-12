import 'package:business_app/features/store/data/datasources/promotion_local_datasource_impl.dart';
// import 'package:business_app/features/store/data/datasources/promotion_remote_datasource.dart';

import '../../domain/entities/promotion_entity.dart';

class PromotionRepositoryImpl {
  // final PromotionRemoteDataSource dataSource;
  final PromotionLocalDatasourceImpl dataSource;

  PromotionRepositoryImpl(this.dataSource);

  Future<List<PromotionEntity>> getPromotions(int page, int pageSize) {
    return dataSource.getPromotions(page, pageSize);
  }
}
