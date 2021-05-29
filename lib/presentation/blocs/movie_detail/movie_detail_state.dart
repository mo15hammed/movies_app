part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}
class MovieDetailError extends MovieDetailState {
  final String message;
  final AppErrorType errorType;

  const MovieDetailError(this.message, this.errorType);
}
class MovieDetailSuccess extends MovieDetailState {
  final MovieDetailEntity movieDetailEntity;

  const MovieDetailSuccess(this.movieDetailEntity);

  @override
  List<Object> get props => [movieDetailEntity];
}
