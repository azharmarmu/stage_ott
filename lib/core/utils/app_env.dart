import 'package:stage_ott/core/extensions/string_ext.dart';

enum Env { dev }

Env? getEnv(String? name) {
  if (name.equals(Env.dev.name)) {
    return Env.dev;
  }
  return null;
}

abstract class AppEnv {
  static late String tmdbBaseUrl;
  static String tmdbAuthToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MDMxNDE3MTI5YmE2NDMyMjUyMWQ2NWFhMGE1NTdhMiIsIm5iZiI6MTUyNTMzOTMyMy40MTgsInN1YiI6IjVhZWFkNGJiYzNhMzY4MmRmMjAwMWFlMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8fcpwTZpkL1aoNzMogf9Utt-FFOWplFZfvDiWivwP5A';
  static String tmdbImageBasePath = 'https://image.tmdb.org/t/p/w500';
  static late String title;

  static late Env _env;
  static Env get env => _env;

  static setupEnv(Env env) {
    _env = env;
    switch (env) {
      case Env.dev:
        {
          tmdbBaseUrl = 'https://api.themoviedb.org/3/';
          title = 'Stage OTT-${env.name.toUpperCase()}';
          break;
        }
    }
  }
}
