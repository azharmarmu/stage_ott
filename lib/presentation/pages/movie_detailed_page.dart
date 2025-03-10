import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/movie_entity.dart';
import '../widgets/base_template.dart';

class MovieDetailedPage extends StatelessWidget {
  final MovieEntity movie;
  const MovieDetailedPage({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return BaseTemplate(
      appBar: AppBar(
        title: Text(
          movie.title,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 12.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie.overview,
              //maxLines: 2,
              //overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
