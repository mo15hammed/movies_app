part of 'movie_tabs_bloc.dart';

abstract class MovieTabsState extends Equatable {
  final int currentTabIndex;

  const MovieTabsState({this.currentTabIndex = 0});
  @override
  List<Object> get props => [currentTabIndex];
}

class MovieTabsInitial extends MovieTabsState {}

class MovieTabChanged extends MovieTabsState {
  const MovieTabChanged({
    currentTabIndex,
  }) : super(currentTabIndex: currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex];
}

class MovieTabLoadSuccess extends MovieTabsState {
  final List<MovieEntity> movies;

  const MovieTabLoadSuccess({
    currentTabIndex,
    required this.movies,
  }) : super(currentTabIndex: currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex, movies];
}

class MovieTabLoadError extends MovieTabsState {
  const MovieTabLoadError({
    currentTabIndex,
  }) : super(currentTabIndex: currentTabIndex);
}
