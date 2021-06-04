part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {

}
class SearchLoading extends SearchState {

}
class SearchSuccess extends SearchState {
  final List<MovieEntity> movies;

  const SearchSuccess(this.movies);

  @override
  List<Object> get props => [movies];
}
class SearchError extends SearchState {
  final String message;
  final AppErrorType errorType;

  SearchError({
    this.message,
    this.errorType,
  });

  @override
  List<Object> get props => [message, errorType];
}
