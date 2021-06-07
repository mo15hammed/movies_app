part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class LoadFavMoviesEvent extends FavoriteEvent {}

class DeleteFavMovieEvent extends FavoriteEvent {
  final int movieId;

  DeleteFavMovieEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}

class ToggleFavMovieEvent extends FavoriteEvent {
  final MovieEntity movieEntity;
  final bool isFav;

  ToggleFavMovieEvent({
    @required this.movieEntity,
    @required this.isFav,
  });

  @override
  List<Object> get props => [movieEntity, isFav];
}

class CheckIsFavMovieEvent extends FavoriteEvent {
  final int movieId;

  CheckIsFavMovieEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}
