import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/di/get_it.dart';
import 'package:movies_app/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movies_app/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:movies_app/common/constants/size_constraints.dart';

import 'package:movies_app/common/extensions/size_extensions.dart';

import 'big_poster.dart';

class MovieDetailScreen extends StatelessWidget {
  final MovieDetailArgument args;
  const MovieDetailScreen({
    Key key,
    @required this.args,
  })  : assert(args != null, 'args cannot be null'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MovieDetailBloc>.value(
        value: getItInstance<MovieDetailBloc>()..add(MovieDetailLoadEvent(args.movieId)),
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailSuccess) {
              final movie = state.movieDetailEntity;
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BigPoster(
                    movie: movie,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizes.dimen_6.w,
                    ),
                    child: Text(
                      movie.overview,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  )
                ],
              );
            }
            if (state is MovieDetailError) {
              return Container();
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
