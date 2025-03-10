import 'package:either_dart/either.dart';

import '../utils/app_error.dart';

extension FutureExtension on Future {
  Future<Either<AppError, T>> guard<T>(Function(dynamic) parse) async {
    try {
      final response = await this as T;
      return Right(response);
    } on AppDioError catch (e) {
      return Left(e);
    } on AppException catch (e) {
      return Left(e);
    }
  }
}
