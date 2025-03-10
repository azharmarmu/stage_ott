import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:stage_ott/core/network/api_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stage_ott/data/sources/remote/movie_ds.dart';
import 'package:stage_ott/domain/usecases/get_movies_uc.dart';

import '../../data/repositories/movie_repo.dart';
import '../../domain/repositories/movies_repo.dart';
import '../../presentation/blocs/movie_cubit.dart';
import '../network/movie_service.dart';
import 'app_strings.dart';

final locator = GetIt.I;

Future<void> init() async {
  await _hiveConfig();
  _apiConfig();

  // Repository
  locator.registerLazySingleton<MoviesDS>(
    () => MoviesDSImpl(),
  );

  // Repository
  locator.registerLazySingleton<MoviesRepo>(
    () => MoviesRepoImpl(),
  );

  // UseCase
  locator.registerLazySingleton(() => GetMoviesUC());

  // Cubit
  locator.registerFactory(() => MovieCubit());
}

Future<void> _hiveConfig() async {
  await Hive.initFlutter();
  final box = await Hive.openBox(AppStrings.appName);
  locator.registerLazySingleton<Box>(
    () => box,
  );
}

void _apiConfig() {
  locator.registerLazySingleton<ApiService>(
    () => ApiService(dio: Dio()),
  );
  locator.registerLazySingleton<MovieApiService>(
    () => MovieApiService(),
  );
}
