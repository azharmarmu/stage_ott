import 'package:either_dart/either.dart';

import '../utils/app_error.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}

abstract class UseCaseHive<Type, Params> {
  Future<Type> call(Params params);
}
