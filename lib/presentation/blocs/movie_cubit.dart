import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stage_ott/core/params/no_params.dart';
import 'package:stage_ott/core/utils/app_di.dart';
import 'package:stage_ott/domain/entities/movie_entity.dart';
import 'package:stage_ott/domain/usecases/get_movies_uc.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final GetMoviesUC _getMoviesUC = locator.get<GetMoviesUC>();

  MovieCubit() : super(MovieInitial());

  Future<void> fetchMovies() async {
    emit(MovieLoading());
    try {
      final res = await _getMoviesUC(NoParams());
      res.fold(
        (left) {
          emit(MovieError('${left.error}'));
        },
        (right) {
          emit(MovieLoaded(right));
        },
      );
    } catch (e) {
      emit(MovieError('Failed to load movies'));
    }
  }
}
