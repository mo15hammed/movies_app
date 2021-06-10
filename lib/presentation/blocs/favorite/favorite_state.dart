part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavMoviesLoaded extends FavoriteState {
  final List<MovieEntity> movies;

  FavMoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class FavMoviesError extends FavoriteState {
  final String message;

  const FavMoviesError(this.message);

  @override
  List<Object> get props => [message];
}

class IsFavoriteMovie extends FavoriteState {
  final bool isFav;

  IsFavoriteMovie(this.isFav);

  @override
  List<Object> get props => [isFav];
}
