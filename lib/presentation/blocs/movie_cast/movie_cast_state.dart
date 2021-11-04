part of 'movie_cast_bloc.dart';

abstract class MovieCastState extends Equatable {
  const MovieCastState();

  @override
  List<Object> get props => [];
}

class MovieCastInitial extends MovieCastState {}

class MovieCastLoadSuccess extends MovieCastState {

  final List<CastEntity> cast;

  const MovieCastLoadSuccess(this.cast);

  @override
  List<Object> get props => [cast];
}

class MovieCastLoadError extends MovieCastState {
  final String message;
  final AppErrorType errorType;

  const MovieCastLoadError(this.message, this.errorType);

  @override
  List<Object> get props => [message, errorType];
}
