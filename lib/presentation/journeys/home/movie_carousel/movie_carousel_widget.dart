import 'package:flutter/material.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/presentation/journeys/home/movie_carousel/movie_page_view.dart';
import 'package:movies_app/presentation/widgets/movie_app_bar.dart';
import 'package:movies_app/presentation/widgets/separator.dart';

import 'movie_backdrop_widget.dart';
import 'movie_data_widget.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int index;

  const MovieCarouselWidget({
    Key? key,
    required this.movies,
    this.index = 0,
  })  : assert(index >= 0, 'index must be greater than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const MovieBackdropWidget(),
        Column(
          children: [
            const MovieAppBar(),
            MoviePageView(
              movies: movies,
              index: index,
            ),
            const MovieDataWidget(),
            const Separator(),
          ],
        ),
      ],
    );
  }
}
