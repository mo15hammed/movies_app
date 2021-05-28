import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/common/extensions/size_extensions.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/presentation/journeys/home/movie_tabs/movie_tab_card_widget.dart';

class MovieListviewWidget extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieListviewWidget({
    Key key,
    @required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Sizes.dimen_6.h),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
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
