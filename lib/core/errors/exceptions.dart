abstract class AppException implements Exception {
  final String? message;
  const AppException([this.message]);
}

class ServerException extends AppException {
  const ServerException([super.message]);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException([super.message]);
}

class NotFoundException extends AppException {
  const NotFoundException([super.message]);
}

class ConnectionException extends AppException {
  const ConnectionException([super.message]);
}
