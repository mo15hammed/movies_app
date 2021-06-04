part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class LoadSearchMoviesEvent extends SearchEvent {
  final String query;

  const LoadSearchMoviesEvent(this.query);

  @override
  List<Object> get props => [query];
}
