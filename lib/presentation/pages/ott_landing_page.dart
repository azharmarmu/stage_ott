import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stage_ott/core/utils/app_di.dart';
import 'package:stage_ott/presentation/blocs/movie_cubit.dart';

import '../widgets/base_template.dart';
import 'widgets/grid_movie_view.dart';
import 'widgets/list_movie_view.dart';

class OTTLandingPage extends StatelessWidget {
  const OTTLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final movieCubit = locator.get<MovieCubit>();
    return BaseTemplate(
      appBar: AppBar(
        title: Text('Now Playing'),
        actions: [
          IconButton(
            onPressed: () => movieCubit.switchMovieViewType(),
            icon: Icon(
              viewTypeUI(movieCubit.isGrid),
            ),
          )
        ],
      ),
      body: BlocBuilder(
        bloc: movieCubit..fetchMovies(),
        builder: (_, state) {
          if (state == MovieState.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state == MovieState.error) {
            return Center(child: Text(movieCubit.error ?? 'Error'));
          } else if (state == MovieState.success) {
            if (movieCubit.movies.isNotEmpty) {
              if (movieCubit.isGrid) {
                return GridMovieView(movies: movieCubit.movies);
              } else {
                return ListMovieView(movies: movieCubit.movies);
              }
            }
            return Center(child: Text('No movies playing now'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  IconData viewTypeUI(bool isGrid) =>
      isGrid ? Icons.grid_3x3_rounded : Icons.list_alt_rounded;
}
