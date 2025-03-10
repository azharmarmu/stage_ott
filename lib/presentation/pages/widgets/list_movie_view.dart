import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stage_ott/domain/entities/movie_entity.dart';

import '../../../core/utils/app_env.dart';

class ListMovieView extends StatelessWidget {
  final List<MovieEntity> movies;

  const ListMovieView({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
      onTap: () {},
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                imageUrl,
                width: 100,
                height: 75,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.broken_image,
                  size: 75,
                ),
              ),
            ),
            SizedBox(width: 8.h),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
