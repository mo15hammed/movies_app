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

  const MovieCarouselError({
    required this.message,
    required this.errorType,
  });

  @override
  List<Object> get props => [errorType, message];
}

class MovieCarouselLoaded extends MovieCarouselState {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselLoaded({
    required this.movies,
    this.defaultIndex = 0,
  }) : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');

  @override
  List<Object> get props => [defaultIndex];
}
