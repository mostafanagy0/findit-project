abstract class AppFailure {
  final String message;
  const AppFailure(this.message);
}

class NetworkFailure extends AppFailure {
  const NetworkFailure(super.message);
}

class ServerFailure extends AppFailure {
  const ServerFailure(super.message);
}

class ValidationFailure extends AppFailure {
  const ValidationFailure(super.message);
}

class UnknownFailure extends AppFailure {
  const UnknownFailure(super.message);
}
