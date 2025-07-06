import 'package:business_app/core/network/api_endpoints.dart';
import 'package:business_app/features/product/data/models/category_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/network/dio_client.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDatasource {
  Future<List<ProductModel>> getProducts({
    required int page,
    required int pageSize,
  });
  Future<List<CategoryModel>> getCategories({
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
      ApiEndpoints.storeProducts,
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

  @override
  Future<List<CategoryModel>> getCategories({
    required int page,
    required int pageSize,
  }) async {
    final res = await client.dio.get(
      ApiEndpoints.storeCategories,
      queryParameters: {'page': page, 'page_size': pageSize},
    );

    debugPrint('Response Categories ${res.data['data']}');

    final List data = res.data['data'];
    final List<CategoryModel> categories =
        data
            .map((json) => CategoryModel.fromJson(json as Map<String, dynamic>))
            .toList();

    return categories;
  }
}
