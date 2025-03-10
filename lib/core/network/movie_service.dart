import 'package:dio/dio.dart';
import 'package:stage_ott/core/network/api_service.dart';

import '../utils/app_env.dart';

class MovieApiService extends ApiService {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: AppEnv.tmdbBaseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );

  MovieApiService._internal()
      : super(dio: _dio..interceptors.add(LogInterceptor(responseBody: true)));

  static final MovieApiService _instance = MovieApiService._internal();

  factory MovieApiService() {
    return _instance;
  }
}

mixin MovieApiEndPoint {
  static const String movieRoot = '/movie';
  static String nowPlaying() => '$movieRoot/now_playing';
}
