import 'package:either_dart/either.dart';
import 'package:stage_ott/domain/entities/movie_entity.dart';

import '../../core/utils/app_error.dart';

abstract class MoviesRepo {
  Future<Either<AppError, List<MovieEntity>>> getMovies();
}
