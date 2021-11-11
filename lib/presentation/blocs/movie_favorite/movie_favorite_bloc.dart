import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/movie_params.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/usecases/check_if_movie_is_favorite.dart';
import 'package:movies_app/domain/usecases/delete_favorite_movie.dart';
import 'package:movies_app/domain/usecases/get_favorite_movies.dart';
import 'package:movies_app/domain/usecases/save_favorite_movie.dart';

part 'movie_favorite_event.dart';
part 'movie_favorite_state.dart';

class MovieFavoriteBloc extends Bloc<MovieFavoriteEvent, MovieFavoriteState> {
  final GetFavoriteMovies getFavoriteMovies;
  final SaveFavoriteMovie saveFavoriteMovie;
  final DeleteFavoriteMovie deleteFavoriteMovie;
  final CheckIfMovieIsFavorite checkIfMovieIsFavorite;

  MovieFavoriteBloc({
    required this.getFavoriteMovies,
    required this.saveFavoriteMovie,
    required this.deleteFavoriteMovie,
    required this.checkIfMovieIsFavorite,
  }) : super(MovieFavoriteInitial()) {
    on<ToggleFavoriteMoviesEvent>(_onToggleFavMovie);
    on<LoadFavoriteMoviesEvent>(_onLoadFavMovies);
    on<DeleteFavoriteMovieEvent>(_onDeleteFavMovies);
    on<CheckFavoriteMoviesEvent>(_onCheckFavMovies);
  }

  Future<void> _onToggleFavMovie(
    ToggleFavoriteMoviesEvent event,
    Emitter<MovieFavoriteState> emit,
  ) async {
    print(event);
    if (event.isFavorite) {
      final deleteEither =
          await deleteFavoriteMovie(MovieParams(event.movie.id));

      deleteEither.fold((l) {
        return emit(MovieFavoriteLoadError(
          message: l.message,
          errorType: l.errorType,
        ));
      }, (r) => {});
    } else {
      final saveEither = await saveFavoriteMovie(event.movie);
      saveEither.fold((l) {
        return emit(MovieFavoriteLoadError(
          message: l.message,
          errorType: l.errorType,
        ));
      }, (r) => {});
    }

    final resEither = await checkIfMovieIsFavorite(MovieParams(event.movie.id));

    resEither.fold(
      (l) {
        emit(MovieFavoriteLoadError(
          message: l.message,
          errorType: l.errorType,
        ));
      },
      (isFavorite) {
        emit(MovieFavoriteToggle(isFavorite));
      },
    );
  }

  Future<void> _onLoadFavMovies(
    LoadFavoriteMoviesEvent event,
    Emitter<MovieFavoriteState> emit,
  ) async {
    final resEither = await getFavoriteMovies(NoParams());

    return resEither.fold(
      (l) => emit(
        MovieFavoriteLoadError(
          message: l.message,
          errorType: l.errorType,
        ),
      ),
      (movies) => emit(MovieFavoriteLoadSuccess(movies)),
    );
  }

  Future<void> _onDeleteFavMovies(
    DeleteFavoriteMovieEvent event,
    Emitter<MovieFavoriteState> emit,
  ) async {
    final resEither = await deleteFavoriteMovie(MovieParams(event.movieId));

    resEither.fold(
      (l) => emit(
        MovieFavoriteLoadError(
          message: l.message,
          errorType: l.errorType,
        ),
      ),
      (movies) => add(LoadFavoriteMoviesEvent()),
    );
  }

  Future<void> _onCheckFavMovies(
    CheckFavoriteMoviesEvent event,
    Emitter<MovieFavoriteState> emit,
  ) async {
    final resEither = await checkIfMovieIsFavorite(MovieParams(event.movieId));

    resEither.fold(
      (l) => emit(
        MovieFavoriteLoadError(
          message: l.message,
          errorType: l.errorType,
        ),
      ),
      (isFavorite) => emit(MovieFavoriteToggle(isFavorite)),
    );
  }
}
