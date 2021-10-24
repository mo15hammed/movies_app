import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

import 'animated_movie_card_widget.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int index;

  const MoviePageView({
    Key? key,
    required this.movies,
    this.index = 0,
  })  : assert(index >= 0, 'index must be greater than 0'),
        super(key: key);

  @override
  State<MoviePageView> createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.index,
      keepPage: false,
      viewportFraction: 0.7,
    );

    context
        .read<MovieBackdropBloc>()
        .add(MovieBackdropChangedEvent(widget.movies[0]));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      height: 0.40.sh,
      clipBehavior: Clip.none,
      child: PageView.builder(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        pageSnapping: true,
        itemCount: widget.movies.length,
        itemBuilder: (_, i) {
          final movie = widget.movies[i];
          return AnimatedMovieCardWidget(
            index: i,
            pageController: _pageController,
            movieId: movie.id!,
            posterPath: movie.posterPath ?? '',
          );
        },
        onPageChanged: (index) {
          context
              .read<MovieBackdropBloc>()
              .add(MovieBackdropChangedEvent(widget.movies[index]));
        },
      ),
    );
  }
}
