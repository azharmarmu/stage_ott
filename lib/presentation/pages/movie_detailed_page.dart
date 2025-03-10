import 'package:flutter/material.dart';

import '../../domain/entities/movie_entity.dart';
import '../widgets/base_template.dart';

class MovieDetailedPage extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieDetailedPage({
    super.key,
    required this.movieEntity,
  });

  @override
  Widget build(BuildContext context) {
    return BaseTemplate(
      appBar: AppBar(
        title: Text('${movieEntity.title}'),
      ),
      body: Text('Show Detailed Screen'),
    );
  }
}
