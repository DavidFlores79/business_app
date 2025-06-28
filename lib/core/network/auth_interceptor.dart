import 'package:dio/dio.dart';

import '../services/local_storage_service.dart';

class AuthInterceptor extends Interceptor {
  final TokenStorageService tokenStorage;

  AuthInterceptor({required this.tokenStorage});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await tokenStorage.getToken();

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }
}
