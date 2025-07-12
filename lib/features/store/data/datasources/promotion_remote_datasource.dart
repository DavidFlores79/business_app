import 'package:flutter/material.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/entities/promotion_entity.dart';

abstract class PromotionRemoteDataSource {
  Future<List<PromotionEntity>> getPromotions(int page, int pageSize);
}

class PromotionRemoteDatasource {
  final DioClient client;
  PromotionRemoteDatasource(this.client);

  Future<List<PromotionEntity>> getPromotions(int page, int pageSize) async {
    final res = await client.dio.get(
      ApiEndpoints.storePromotions,
      queryParameters: {'page': page, 'page_size': pageSize},
    );

    debugPrint('Response: ${res.data}');

    final List data = res.data['data'];
    final List<PromotionEntity> promotions =
        data
            .map(
              (json) => PromotionEntity.fromJson(json as Map<String, dynamic>),
            )
            .toList();

    return promotions;
  }
}
