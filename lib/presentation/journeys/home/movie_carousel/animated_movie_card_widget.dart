import 'package:flutter/material.dart';
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
        value = (1 - (value.abs() * 0.12)).clamp(0.0, 1.0);

        return Transform.scale(
          scale: value,
          filterQuality: FilterQuality.high,
          alignment: Alignment.topCenter,
          child: child,
        );
      },
      child: MovieCardWidget(
        movieId: movieId,
        posterPath: posterPath,
      ),
    );
  }
}
