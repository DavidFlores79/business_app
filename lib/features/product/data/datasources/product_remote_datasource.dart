import 'package:business_app/core/network/api_endpoints.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/network/dio_client.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDatasource {
  Future<List<ProductModel>> getProducts({
    required int page,
    required int pageSize,
  });
}

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final DioClient client;

  ProductRemoteDatasourceImpl(this.client);

  @override
  Future<List<ProductModel>> getProducts({
    required int page,
    required int pageSize,
  }) async {
    final res = await client.dio.get(
      ApiEndpoints.store_products,
      queryParameters: {'page': page, 'page_size': pageSize},
    );

    debugPrint('Response: ${res.data}');

    final List data = res.data['data']; // ✅ accede correctamente a la lista
    final List<ProductModel> products =
        data
            .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
            .toList();

    return (products);
  }
}
