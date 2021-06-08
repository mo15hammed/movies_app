import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'fav_movie_card_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavMoviesWidget extends StatelessWidget {
  final List<MovieEntity> movies;

  const FavMoviesWidget({
    Key key,
    @required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
      child: GridView.builder(
        itemCount: movies.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: Sizes.dimen_14.w,
          mainAxisSpacing: Sizes.dimen_14.h,
        ),
        itemBuilder: (context, index) {
          return FavMovieCardWidget(
            movie: movies[index],
          );
        },
      ),
    );
  }
}
