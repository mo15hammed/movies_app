import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/common/extensions/size_extensions.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/presentation/widgets/movie_app_bar.dart';
import 'package:movies_app/presentation/widgets/separator.dart';

import 'movie_backdrop_widget.dart';
import 'movie_data_widget.dart';
import 'movie_page_view.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget({
    @required this.movies,
    @required this.defaultIndex,
  }) : assert(defaultIndex >= 0, 'defaultIndex cannot not be less than 0');

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MovieBackdropWidget(),
        Column(
          children: [
            MovieAppBar(),
            MoviePageView(
              movies: movies,
              initialPage: defaultIndex,
            ),
            MovieDataWidget(),
            Separator(),
            SizedBox(height: Sizes.dimen_6.h),
          ],
        ),
      ],
    );
  }
}
