import 'package:either_dart/either.dart';
import 'package:stage_ott/core/params/no_params.dart';

import '../../core/usecases/usecase.dart';
import '../../core/utils/app_di.dart';
import '../../core/utils/app_error.dart';
import '../entities/movie_entity.dart';
import '../repositories/movies_repo.dart';

class GetMoviesUC extends UseCase<List<MovieEntity>, NoParams> {
  final _repository = locator.get<MoviesRepo>();
  GetMoviesUC();

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams params) async {
    return _repository.getMovies();
  }
}
