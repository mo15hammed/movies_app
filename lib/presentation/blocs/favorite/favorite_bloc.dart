import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/movie_params.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/usecases/delete_fav_movie.dart';
import 'package:movies_app/domain/usecases/get_fav_movies.dart';
import 'package:movies_app/domain/usecases/is_fav_movie.dart';
import 'package:movies_app/domain/usecases/save_fav_movie.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final SaveFavMovie saveFavMovie;
  final GetFavMovies getFavMovies;
  final DeleteFavMovie deleteFavMovie;
  final IsFavMovie isFavMovie;

  FavoriteBloc({
    @required this.saveFavMovie,
    @required this.getFavMovies,
    @required this.deleteFavMovie,
    @required this.isFavMovie,
  }) : super(FavoriteInitial());

  @override
  Stream<FavoriteState> mapEventToState(
    FavoriteEvent event,
  ) async* {
    if (event is ToggleFavMovieEvent) {
      if (event.isFav) {
        await deleteFavMovie(MovieParams(event.movieEntity.id));
      } else {
        await saveFavMovie(event.movieEntity);
      }
      final response = await isFavMovie(MovieParams(event.movieEntity.id));
      yield response.fold(
        (l) => FavMoviesError(),
        (r) => IsFavoriteMovie(r),
      );
    } else if (event is LoadFavMoviesEvent) {
      yield* _fetchFavoriteMovies();
    } else if (event is DeleteFavMovieEvent) {
      await deleteFavMovie(MovieParams(event.movieId));
      yield* _fetchFavoriteMovies();
    } else if (event is CheckIsFavMovieEvent) {
      final response = await isFavMovie(MovieParams(event.movieId));
      yield response.fold(
        (l) {
          return FavMoviesError();
        },
        (r) {
          return IsFavoriteMovie(r);
        },
      );
    }
  }

  Stream<FavoriteState> _fetchFavoriteMovies() async* {
    final response = await getFavMovies(NoParams());
    yield response.fold(
      (l) => FavMoviesError(),
      (movies) => FavMoviesLoaded(movies),
    );
  }
}
