import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stage_ott/core/params/no_params.dart';
import 'package:stage_ott/core/utils/app_di.dart';
import 'package:stage_ott/domain/entities/movie_entity.dart';
import 'package:stage_ott/domain/usecases/get_movies_uc.dart';

part 'movie_state.dart';

enum MovieViewType {
  list,
  grid,
}

class MovieCubit extends Cubit<MovieState> {
  final GetMoviesUC _getMoviesUC = locator.get<GetMoviesUC>();

  MovieViewType movieViewType = MovieViewType.grid;

  MovieCubit() : super(MovieState.initial);

  bool get isGrid => movieViewType == MovieViewType.grid;

  void switchMovieViewType() {
    if (isGrid) {
      movieViewType = MovieViewType.list;
    } else {
      movieViewType = MovieViewType.grid;
    }
    refresh();
  }

  final List<MovieEntity> movies = [];
  String? error;
  Future<void> fetchMovies() async {
    emit(MovieState.loading);
    movies.clear();
    try {
      final res = await _getMoviesUC(NoParams());
      res.fold(
        (left) {
          error = '${left.error}';
          emit(MovieState.error);
        },
        (right) {
          movies.addAll(right);
          emit(MovieState.success);
        },
      );
    } catch (e) {
      error = 'Failed to load movies';
      emit(MovieState.error);
    }
  }

  void refresh() {
    if (state == MovieState.success) {
      emit(MovieState.initial);
    }
    emit(MovieState.success);
  }
}
