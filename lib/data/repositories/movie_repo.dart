

import 'package:either_dart/either.dart';
import 'package:stage_ott/core/extensions/future_ext.dart';
import 'package:stage_ott/data/models/movie_model.dart';

import '../../core/utils/app_di.dart';
import '../../core/utils/app_error.dart';
import '../../domain/repositories/movies_repo.dart';
import '../sources/remote/movie_ds.dart';

class MoviesRepoImpl extends MoviesRepo {
  final _ds = locator.get<MoviesDS>();

  @override
  Future<Either<AppError, List<MovieModel>>> getMovies() async {
    return await _ds.getMovies().guard((data) => data);
  }
}
