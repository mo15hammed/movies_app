part of 'videos_bloc.dart';

abstract class VideosState extends Equatable {
  const VideosState();

  @override
  List<Object> get props => [];
}

class VideosInitial extends VideosState {}


class VideosLoadSuccess extends VideosState {
  final List<VideoEntity> videos;

  const VideosLoadSuccess(this.videos);

  @override
  List<Object> get props => [videos];
}
class VideosLoadError extends VideosState {}

