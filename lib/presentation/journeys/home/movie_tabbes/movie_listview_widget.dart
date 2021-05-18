import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/constraints/size_constraints.dart';
import 'package:movies_app/common/extensions/size_extensions.dart';
import 'package:movies_app/data/core/api_constants.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/presentation/journeys/home/movie_tabbes/movie_tab_card_widget.dart';

class MovieListviewWidget extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieListviewWidget({
    Key key,
    @required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        // shrinkWrap: true,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return MovieTabCardWidget(
            movieId: movie.id,
            title: movie.title,
            posterPath: movie.posterPath,
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: Sizes.dimen_4.w),
        itemCount: movies.length,
      ),
    );
  }
}
