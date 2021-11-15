import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/locale_keys.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/di/get_it.dart';
import 'package:movies_app/presentation/blocs/movie_cast/movie_cast_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_details/movie_details_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_favorite/movie_favorite_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/journeys/home/movie_carousel/app_error_widget.dart';
import 'package:movies_app/presentation/journeys/loading/loading_widget.dart';
import 'package:movies_app/presentation/routing/app_router.dart';
import 'package:movies_app/presentation/widgets/button.dart';
import 'movie_cast/movie_cast_widget.dart';
import 'movie_poster/big_poster_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;

  const MovieDetailsScreen({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<MovieDetailsBloc>(
            create: (context) => getItInstance<MovieDetailsBloc>()
              ..add(MovieDetailsLoadEvent(movieId)),
          ),
          BlocProvider<MovieCastBloc>(
            create: (context) => getItInstance<MovieCastBloc>()
              ..add(LoadMovieCastEvent(movieId)),
          ),
          BlocProvider<MovieFavoriteBloc>(
            create: (context) => getItInstance<MovieFavoriteBloc>(),
          ),
        ],
        child: BlocConsumer<MovieDetailsBloc, MovieDetailsState>(
          listener: (context, state) {
            if (state is MovieDetailsSuccess) {
              context
                  .read<MovieFavoriteBloc>()
                  .add(CheckFavoriteMoviesEvent(state.movie.id));
            }
          },
          builder: (context, state) {
            if (state is MovieDetailsSuccess) {
              final movie = state.movie;
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigPosterWidget(
                      movie: movie,
                    ),
                    Padding(
                      padding: EdgeInsets.all(Sizes.dimen_16.w),
                      child: Text(
                        movie.overview ?? '',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_16.w,
                      ),
                      child: Text(
                        LocaleKeys.cast.tr(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    const MovieCastWidget(),
                    Padding(
                      padding: EdgeInsets.all(Sizes.dimen_16.w),
                      child: Button(
                        text: LocaleKeys.watchTrailers.tr(),
                        expanded: true,
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            AppRouter.videos,
                            arguments: movieId,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is MovieDetailsError) {
              return AppErrorWidget(
                message: state.message,
                errorType: state.errorType,
                onRetryPressed: () {
                  context
                      .read<MovieDetailsBloc>()
                      .add(MovieDetailsLoadEvent(movieId));
                },
              );
            }
            return LoadingWidget(size: Sizes.dimen_200.w);
          },
        ),
      ),
    );
  }
}
