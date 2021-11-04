part of 'movie_videos_bloc.dart';

abstract class MovieVideosState extends Equatable {
  const MovieVideosState();

  @override
  List<Object> get props => [];
}

class MovieVideosInitial extends MovieVideosState {}

class MovieVideosLoadSuccess extends MovieVideosState {
  final List<VideoEntity> videos;

  const MovieVideosLoadSuccess(this.videos);

  @override
  List<Object> get props => [videos];
}

class MovieVideosLoadError extends MovieVideosState {
  final String message;
  final AppErrorType errorType;

  const MovieVideosLoadError(this.message, this.errorType);

  @override
  List<Object> get props => [message, errorType];
}
