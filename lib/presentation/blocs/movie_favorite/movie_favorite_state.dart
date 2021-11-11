part of 'movie_favorite_bloc.dart';

abstract class MovieFavoriteState extends Equatable {
  const MovieFavoriteState();

  @override
  List<Object> get props => [];
}

class MovieFavoriteInitial extends MovieFavoriteState {}

class MovieFavoriteLoadSuccess extends MovieFavoriteState {
  final List<MovieEntity> movies;

  const MovieFavoriteLoadSuccess(this.movies);

  @override
  List<Object> get props => [movies];
}

class MovieFavoriteLoadError extends MovieFavoriteState {
  final String message;
  final AppErrorType errorType;

  const MovieFavoriteLoadError({
    required this.message,
    required this.errorType,
  });

  @override
  List<Object> get props => [message, errorType];
}

class MovieFavoriteToggle extends MovieFavoriteState {
  final bool isMovieFavorite;

  const MovieFavoriteToggle(this.isMovieFavorite);

  @override
  List<Object> get props => [isMovieFavorite];
}
