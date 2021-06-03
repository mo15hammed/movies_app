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

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final CastBloc castBloc;

  MovieDetailBloc({
    @required this.getMovieDetail,
    @required this.castBloc,
  }) : super(MovieDetailInitial());

  @override
  Stream<MovieDetailState> mapEventToState(
    MovieDetailEvent event,
  ) async* {
    if (event is MovieDetailLoadEvent) {
      final Either<AppError, MovieDetailEntity> eitherResponse =
          await getMovieDetail(MovieParams(event.movieId));

      yield eitherResponse.fold(
        (l) => MovieDetailError(l.message, l.errorType),
        (movie) {
          castBloc.add(LoadCastEvent(movieId: event.movieId));
          return MovieDetailSuccess(movie);
        },
      );

    }
  }
}
