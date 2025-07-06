abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure() : super("No autorizado. Inicia sesión.");
}

class ConnectionFailure extends Failure {
  const ConnectionFailure() : super("Sin conexión a internet.");
}

class UnknownFailure extends Failure {
  const UnknownFailure() : super("Ocurrió un error inesperado.");
}
