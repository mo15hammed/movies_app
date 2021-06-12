import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_detail_entity.dart';
import 'package:movies_app/domain/entities/movie_params.dart';
import 'package:movies_app/domain/usecases/get_movie_detail.dart';
import 'package:movies_app/presentation/blocs/cast/cast_bloc.dart';
import 'package:movies_app/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:movies_app/presentation/blocs/loading/loading_bloc.dart';
import 'package:movies_app/presentation/blocs/videos/videos_bloc.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final CastBloc castBloc;
  final VideosBloc videosBloc;
  final FavoriteBloc favoriteBloc;
  final LoadingBloc loadingBloc;

  MovieDetailBloc({
    @required this.getMovieDetail,
    @required this.castBloc,
    @required this.videosBloc,
    @required this.favoriteBloc,
    @required this.loadingBloc,
  }) : super(MovieDetailInitial());

  @override
  Stream<MovieDetailState> mapEventToState(
    MovieDetailEvent event,
  ) async* {
    if (event is MovieDetailLoadEvent) {
      loadingBloc.add(StartLoadingEvent());
      final Either<AppError, MovieDetailEntity> eitherResponse =
          await getMovieDetail(MovieParams(event.movieId));

      yield eitherResponse.fold(
        (l) => MovieDetailError(l.message, l.errorType),
        (movie) {
          favoriteBloc.add(CheckIsFavMovieEvent(event.movieId));
          castBloc.add(LoadCastEvent(movieId: event.movieId));
          videosBloc.add(LoadVideosEvent(movieId: event.movieId));
          return MovieDetailSuccess(movie);
        },
      );
      loadingBloc.add(FinishLoadingEvent());
    }
  }
}
