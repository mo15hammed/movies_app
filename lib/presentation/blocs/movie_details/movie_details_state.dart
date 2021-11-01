part of 'movie_details_bloc.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsSuccess extends MovieDetailsState {
  final MovieEntity movie;

  const MovieDetailsSuccess(this.movie);

  @override
  List<Object> get props => [movie];
}

class MovieDetailsError extends MovieDetailsState {
  final String message;
  final AppErrorType errorType;

  const MovieDetailsError({
    required this.message,
    required this.errorType,
  });

  @override
  List<Object> get props => [message, errorType];
}
