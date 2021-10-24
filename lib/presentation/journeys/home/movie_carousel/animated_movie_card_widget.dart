import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'movie_card_widget.dart';

class AnimatedMovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;
  final int index;
  final PageController pageController;

  const AnimatedMovieCardWidget({
    Key? key,
    required this.movieId,
    required this.posterPath,
    required this.index,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = index.toDouble();
        if (pageController.position.haveDimensions) {
          value = pageController.page! - index;
        }
        value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
        return Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: Curves.easeIn.transform(value) * 0.40.sh,
            width: Curves.easeIn.transform(value) * Sizes.dimen_230,
            child: child,
          ),
        );
      },
      child: MovieCardWidget(
        movieId: movieId,
        posterPath: posterPath,
      ),
    );
  }
}
