import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/translation_constants.dart';
import 'package:movies_app/di/get_it.dart';
import 'package:movies_app/presentation/blocs/cast/cast_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movies_app/presentation/blocs/videos/videos_bloc.dart';
import 'package:movies_app/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:movies_app/common/constants/size_constraints.dart';

import 'package:movies_app/common/extensions/size_extensions.dart';
import 'package:movies_app/common/extensions/string_extensions.dart';
import 'package:movies_app/presentation/journeys/movie_detail/videos_widget.dart';
import 'package:movies_app/presentation/widgets/button.dart';

import 'big_poster.dart';
import 'cast_widget.dart';

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
      body: MultiBlocProvider(
        providers: [
          BlocProvider<MovieDetailBloc>.value(
            value: getItInstance<MovieDetailBloc>()..add(MovieDetailLoadEvent(args.movieId)),
          ),
          BlocProvider<CastBloc>.value(
            value: getItInstance<CastBloc>(),
          ),
          BlocProvider<VideosBloc>.value(
            value: getItInstance<VideosBloc>(),
          ),
        ],
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailSuccess) {
              final movie = state.movieDetailEntity;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BigPoster(
                      movie: movie,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: Sizes.dimen_6.w,
                        end: Sizes.dimen_6.w,
                        top: Sizes.dimen_6.h,
                        bottom: Sizes.dimen_12.h,
                      ),
                      child: Text(
                        movie.overview,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_6.w),
                      child: Text(
                        TranslationConsts.cast.t(context),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    CastWidget(),
                    VideosWidget(),

                  ],
                ),
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
