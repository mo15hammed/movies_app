import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'favorite_movie_card.dart';

class FavoriteMoviesGridView extends StatelessWidget {
  final List<MovieEntity> movies;

  const FavoriteMoviesGridView({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: Sizes.dimen_16.w,
            mainAxisSpacing: Sizes.dimen_16.h,
            childAspectRatio: 2 / 3,
          ),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return FavoriteMovieCard(
              movie: movies[index],
            );
          }),
    );
  }
}
