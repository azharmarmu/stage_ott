import 'package:flutter/material.dart';

import '../../presentation/pages/movie_detailed_page.dart';
import '../../presentation/pages/ott_landing_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  String name = settings.name ?? AppRoutes.ottLanding;
  final dynamic args = settings.arguments;

  switch (name) {
    case AppRoutes.ottLanding:
      return MaterialPageRoute(
        builder: (_) => const OTTLandingPage(),
        settings: const RouteSettings(name: AppRoutes.ottLanding),
      );
    case AppRoutes.movieDetail:
      return MaterialPageRoute(
        builder: (_) => MovieDetailedPage(movie: args),
        settings: const RouteSettings(name: AppRoutes.movieDetail),
      );

    default:
      return _errorRoute(args, settings.name);
  }
}

MaterialPageRoute _errorRoute(dynamic args, String? name) {
  return MaterialPageRoute(
    builder: (_) => Center(
      child: Scaffold(
        appBar: AppBar(),
        body: const Placeholder(),
      ),
    ),
    settings: RouteSettings(name: name ?? 'unknown'),
  );
}

mixin AppRoutes {
  static const String ottLanding = '/';
  static const String movieDetail = '/movieDetail';
}
