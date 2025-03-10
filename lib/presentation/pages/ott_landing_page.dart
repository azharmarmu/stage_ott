import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stage_ott/core/utils/app_di.dart';
import 'package:stage_ott/presentation/blocs/movie_cubit.dart';

import '../widgets/base_template.dart';

class OTTLandingPage extends StatelessWidget {
  const OTTLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final movieCubit = locator.get<MovieCubit>();
    return BaseTemplate(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: BlocBuilder(
        bloc: movieCubit..fetchMovies(),
        builder: (_, state) {
          
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
