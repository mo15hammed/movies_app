import 'package:flutter/material.dart';
import 'package:movies_app/common/constraints/size_constraints.dart';
import 'package:movies_app/common/extensions/size_extensions.dart';
import 'package:movies_app/common/screenutils/screenutils.dart';
import 'package:movies_app/presentation/journeys/home/movie_carousel/movie_card_widget.dart';

class AnimatedMovieCardWidget extends StatelessWidget {
  final int index;
  final int movieId;
  final String posterPath;
  final PageController pageCtrl;

  AnimatedMovieCardWidget({
    @required this.index,
    @required this.movieId,
    @required this.posterPath,
    @required this.pageCtrl,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageCtrl,
      builder: (context, child) {
        double value = 1;

        if (pageCtrl.position.haveDimensions) {
          value = pageCtrl.page - index;
          value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: Curves.easeIn.transform(value) * ScreenUtil.defaultSize.height * 0.35,
              width: Sizes.dimen_70.w,
              child: child,
            ),
          );
        } else {
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: Curves.easeIn.transform(index == 0 ? value : value * 0.9) *
                  ScreenUtil.defaultSize.height *
                  0.35,
              width: Sizes.dimen_70.w,
              child: child,
            ),
          );
        }
      },
      child: MovieCardWidget(
        movieId: movieId,
        posterPath: posterPath,
      ),
    );
  }
}