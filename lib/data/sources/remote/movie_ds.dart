import 'package:stage_ott/core/network/movie_service.dart';
import 'package:stage_ott/data/models/movie_model.dart';

import '../../../../core/utils/app_error.dart';
import '../../../core/network/api_service.dart';
import '../../../core/utils/app_di.dart';
import '../../../core/utils/app_env.dart';

abstract class MoviesDS {
  Future<List<MovieModel>> getMovies();
}

class MoviesDSImpl extends MoviesDS {
  final movieApi = locator.get<MovieApiService>();

  @override
  Future<List<MovieModel>> getMovies() async {
    final res = await movieApi.request(
      MovieApiEndPoint.nowPlaying(),
      token: AppEnv.tmdbAuthToken,
      method: Method.get,
    );

    if (res != null && res['success']) {
      final model = List<MovieModel>.from(
        res['data'].map(
          (e) => MovieModel.fromJson(e),
        ),
      );
      return model;
    } else {
      throw AppException(error: res['message']);
    }
  }
}
