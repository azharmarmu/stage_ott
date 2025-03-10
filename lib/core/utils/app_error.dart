sealed class AppError implements Exception {
  final Object error;
  final bool logout;

  const AppError(this.error, this.logout);

  Object get getError => error;

  @override
  String toString() => getError.toString();
}

class AppDioError extends AppError {
  const AppDioError({
    required Object error,
    bool logout = false,
  }) : super(error, logout);
}

class AppException extends AppError {
  const AppException({
    required Object error,
    bool logout = false,
  }) : super(error, logout);
}
