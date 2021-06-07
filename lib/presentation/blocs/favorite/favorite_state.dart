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

class FavMoviesError extends FavoriteState {}

class IsFavoriteMovie extends FavoriteState {
  final bool isFav;

  IsFavoriteMovie(this.isFav);

  @override
  List<Object> get props => [isFav];
}
