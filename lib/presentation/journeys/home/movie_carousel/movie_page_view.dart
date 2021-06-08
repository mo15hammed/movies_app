import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'animatied_movie_card_widget.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;

  const MoviePageView({
    Key key,
    this.movies,
    this.initialPage,
  })  : assert(initialPage >= 0, 'initialPage cannot be less than 0'),
        super(key: key);

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  PageController _pageCtrl;

  @override
  void initState() {
    super.initState();
    _pageCtrl = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: Sizes.dimen_0.h),
        // height: ScreenUtil.defaultSize.height * 0.35,
        child: PageView.builder(
          physics: BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          controller: _pageCtrl,
          itemBuilder: (context, index) {
            final movie = widget.movies[index];
            return AnimatedMovieCardWidget(
              movieId: movie.id,
              posterPath: movie.posterPath,
              pageCtrl: _pageCtrl,
              index: index,
            );
          },
          pageSnapping: true,
          itemCount: widget.movies?.length ?? 0,
          onPageChanged: (index) {
            BlocProvider.of<MovieBackdropBloc>(context).add(MovieBackdropChangedEvent(widget.movies[index]));
          },
        ),
      ),
    );
  }
}
