// error_interceptor.dart
import 'package:business_app/core/config/routes/app_router.dart';
import 'package:dio/dio.dart';

import '../errors/exceptions.dart';
import '../services/local_storage_service.dart';

class ErrorInterceptor extends Interceptor {
  final TokenStorageService tokenStorage;
  final bool redirectOnUnauthorized;

  ErrorInterceptor({
    required this.tokenStorage,
    this.redirectOnUnauthorized = true,
  });

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode;

    if (_isConnectionError(err)) {
      return handler.next(
        DioException(
          requestOptions: err.requestOptions,
          error: ConnectionException('Error de conexión'),
        ),
      );
    }

    switch (statusCode) {
      case 401:
        await _handleUnauthorizedError();
        return handler.next(
          DioException(
            requestOptions: err.requestOptions,
            error: UnauthorizedException('No autorizado'),
          ),
        );
      case 403:
        return handler.next(
          DioException(
            requestOptions: err.requestOptions,
            error: UnauthorizedException('Acceso prohibido'),
          ),
        );
      case 404:
        return handler.next(
          DioException(
            requestOptions: err.requestOptions,
            error: NotFoundException('Recurso no encontrado'),
          ),
        );
      case int code when code >= 500:
        return handler.next(
          DioException(
            requestOptions: err.requestOptions,
            error: ServerException('Error del servidor ($statusCode)'),
          ),
        );
      default:
        return handler.next(
          DioException(
            requestOptions: err.requestOptions,
            error: ServerException('Error desconocido'),
          ),
        );
    }
  }

  bool _isConnectionError(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.connectionError;
  }

  Future<void> _handleUnauthorizedError() async {
    await tokenStorage.deleteToken();

    if (redirectOnUnauthorized) {
      AppRouter.redirectToAuth();
    }
  }
}
