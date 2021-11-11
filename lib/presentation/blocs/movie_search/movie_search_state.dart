part of 'movie_search_bloc.dart';

abstract class MovieSearchState extends Equatable {
  const MovieSearchState();

  @override
  List<Object> get props => [];
}

class MovieSearchInitial extends MovieSearchState {}

class MovieSearchLoading extends MovieSearchState {}

class MovieSearchLoadSuccess extends MovieSearchState {
  final List<MovieEntity> movies;

  const MovieSearchLoadSuccess(this.movies);

  @override
  List<Object> get props => [movies];
}

class MovieSearchLoadError extends MovieSearchState {
  final String message;
  final AppErrorType errorType;
  final String query;

  const MovieSearchLoadError({
    required this.query,
    required this.message,
    required this.errorType,
  });

  @override
  List<Object> get props => [query, message, errorType];
}
