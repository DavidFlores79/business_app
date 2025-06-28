import '../../core/services/local_storage_service.dart';
import 'package:dio/dio.dart';
import '../config/app_config.dart';
import 'auth_interceptor.dart';

class DioClient {
  final Dio dio;

  DioClient(TokenStorageService tokenStorage)
    : dio = Dio(
        BaseOptions(
          baseUrl: AppConfig.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'},
        ),
      ) {
    dio.interceptors.add(AuthInterceptor(tokenStorage: tokenStorage));
  }
}
