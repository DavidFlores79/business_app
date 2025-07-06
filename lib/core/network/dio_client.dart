// DioClient (versión simplificada, similar a la anterior pero con interceptores actualizados)
import 'package:dio/dio.dart';

import '../config/app_config.dart';
import '../services/local_storage_service.dart';
import 'auth_interceptor.dart';
import 'error_interceptor.dart';

class DioClient {
  final Dio dio;
  final TokenStorageService _tokenStorageService;

  DioClient(this._tokenStorageService)
    : dio = Dio(
        BaseOptions(
          baseUrl: AppConfig.baseUrl, // <-- Usa AppConfig directamente
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'},
        ),
      ) {
    _addInterceptors();
  }

  void _addInterceptors() {
    dio.interceptors.addAll([
      AuthInterceptor(tokenStorage: _tokenStorageService),
      ErrorInterceptor(tokenStorage: _tokenStorageService),
    ]);
  }
}
