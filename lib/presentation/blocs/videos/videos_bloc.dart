import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_params.dart';
import 'package:movies_app/domain/entities/video_entity.dart';
import 'package:movies_app/domain/usecases/get_videos.dart';

part 'videos_event.dart';
part 'videos_state.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  final GetVideos getVideos;

  VideosBloc({
    @required this.getVideos,
  }) : super(VideosInitial());

  @override
  Stream<VideosState> mapEventToState(
    VideosEvent event,
  ) async* {
    if (event is LoadVideosEvent) {
      Either<AppError, List<VideoEntity>> eitherVideos =
          await getVideos(MovieParams(event.movieId));

      yield eitherVideos.fold(
        (l) {
          return VideosLoadError();
        },
        (videos) {
          return VideosLoadSuccess(videos);
        },
      );
    }
  }
}
