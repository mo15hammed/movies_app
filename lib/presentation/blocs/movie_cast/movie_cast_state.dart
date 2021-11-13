part of 'movie_cast_bloc.dart';

abstract class MovieCastState extends Equatable {
  const MovieCastState();

  @override
  List<Object> get props => [];
}

class MovieCastInitial extends MovieCastState {}
class MovieCastLoading extends MovieCastState {}

class MovieCastLoadSuccess extends MovieCastState {
  final List<CastEntity> cast;

  const MovieCastLoadSuccess(this.cast);

  @override
  List<Object> get props => [cast];
}

class MovieCastLoadError extends MovieCastState {
  final int movieId;
  final String message;
  final AppErrorType errorType;

  const MovieCastLoadError({
    required this.movieId,
    required this.message,
    required this.errorType,
  });

  @override
  List<Object> get props => [movieId, message, errorType];
}
