part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselState extends Equatable {
  const MovieCarouselState();
  @override
  List<Object> get props => [];
}

class MovieCarouselInitial extends MovieCarouselState {}

class MovieCarouselError extends MovieCarouselState {
  final String message;
  final AppErrorType errorType;

  MovieCarouselError({
    this.message,
    this.errorType,
  });

  @override
  List<Object> get props => [message, errorType];
}

class MovieCarouselLoaded extends MovieCarouselState {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselLoaded({
    this.movies,
    this.defaultIndex = 0,
  }) : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');

  @override
  List<Object> get props => [movies, defaultIndex];
}
