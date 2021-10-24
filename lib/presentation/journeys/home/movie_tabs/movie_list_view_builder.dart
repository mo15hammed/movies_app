import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/presentation/journeys/home/movie_tabs/movie_tab_card_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieListViewBuilder extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieListViewBuilder({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(movies);
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        vertical: Sizes.dimen_12.h,
        horizontal: Sizes.dimen_12.w,
      ),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return MovieTabCardWidget(
          movieId: movie.id!,
          title: movie.title!,
          posterPath: movie.posterPath!,
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: Sizes.dimen_12.w);
      },
      itemCount: movies.length,
    );
  }
}
