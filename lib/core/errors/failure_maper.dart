import 'exceptions.dart';
import 'failures.dart';

Failure mapExceptionToFailure(Exception exception) {
  if (exception is ServerException) {
    return ServerFailure(exception.message ?? "Error en el servidor");
  } else if (exception is UnauthorizedException) {
    return const UnauthorizedFailure();
  } else if (exception is ConnectionException) {
    return const ConnectionFailure();
  } else {
    return const UnknownFailure();
  }
}
