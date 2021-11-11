part of 'movie_favorite_bloc.dart';

abstract class MovieFavoriteEvent extends Equatable {
  const MovieFavoriteEvent();

  @override
  List<Object?> get props => [];
}

class LoadFavoriteMoviesEvent extends MovieFavoriteEvent {}

class DeleteFavoriteMovieEvent extends MovieFavoriteEvent {
  final int movieId;

  const DeleteFavoriteMovieEvent(this.movieId);

  @override
  List<Object?> get props => [movieId];
}

class ToggleFavoriteMoviesEvent extends MovieFavoriteEvent {
  final MovieEntity movie;
  final bool isFavorite;

  const ToggleFavoriteMoviesEvent(this.movie, this.isFavorite);

  @override
  List<Object?> get props => [isFavorite, movie];
}

class CheckFavoriteMoviesEvent extends MovieFavoriteEvent {
  final int movieId;

  const CheckFavoriteMoviesEvent(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
