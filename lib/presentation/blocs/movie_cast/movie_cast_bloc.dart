import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/cast_entity.dart';
import 'package:movies_app/domain/entities/movie_params.dart';
import 'package:movies_app/domain/usecases/get_movie_cast.dart';

part 'movie_cast_event.dart';
part 'movie_cast_state.dart';

class MovieCastBloc extends Bloc<MovieCastEvent, MovieCastState> {
  final GetMovieCast getMovieCast;

  MovieCastBloc(this.getMovieCast) : super(MovieCastInitial()) {
    on<LoadMovieCastEvent>(_onLoadMovieCast);
  }

  Future<void> _onLoadMovieCast(
    LoadMovieCastEvent event,
    Emitter<MovieCastState> emit,
  ) async {
    final castEither = await getMovieCast(MovieParams(event.movieId));

    castEither.fold(
      (l) => emit(MovieCastLoadError(l.message, l.errorType)),
      (cast) => emit(MovieCastLoadSuccess(cast)),
    );
  }
}
