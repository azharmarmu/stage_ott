import 'package:flutter/material.dart';
import 'package:stage_ott/core/extensions/context.ext.dart';
import 'package:stage_ott/core/utils/app_env.dart';
import 'package:stage_ott/domain/entities/movie_entity.dart';

import '../../../core/utils/app_router.dart';

class GridMovieView extends StatelessWidget {
  final List<MovieEntity> movies;
  const GridMovieView({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 movies per row
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.7, // Adjust image size ratio
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return _MovieCard(movie: movies[index]);
      },
    );
  }
}

class _MovieCard extends StatelessWidget {
  final MovieEntity movie;

  const _MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    String imageUrl = '${AppEnv.tmdbImageBasePath}${movie.posterPath}';

    return GestureDetector(
      onTap: () => context.push(
        AppRoutes.movieDetail,
        extra: movie,
      ),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.broken_image, size: 50),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                movie.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
