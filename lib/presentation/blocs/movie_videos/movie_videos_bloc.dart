import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_params.dart';
import 'package:movies_app/domain/entities/video_entity.dart';
import 'package:movies_app/domain/usecases/get_movie_videos.dart';

part 'movie_videos_event.dart';
part 'movie_videos_state.dart';

class MovieVideosBloc extends Bloc<MovieVideosEvent, MovieVideosState> {
  final GetMovieVideos getMovieVideos;

  MovieVideosBloc(this.getMovieVideos) : super(MovieVideosInitial()) {
    on<LoadMovieVideosEvent>(_onLoadMovieVideos);
  }

  Future<void> _onLoadMovieVideos(
    LoadMovieVideosEvent event,
    Emitter<MovieVideosState> emit,
  ) async {
    final castEither = await getMovieVideos(MovieParams(event.movieId));

    castEither.fold(
      (l) => emit(MovieVideosLoadError(l.message, l.errorType)),
      (videos) {
        if (videos.isEmpty) {
        } else {
          emit(MovieVideosLoadSuccess(videos));
        }
      },
    );
  }
}
