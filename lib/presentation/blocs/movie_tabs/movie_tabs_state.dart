part of 'movie_tabs_cubit.dart';

abstract class MovieTabsState extends Equatable {
  final int currentTabIndex;

  const MovieTabsState({this.currentTabIndex = 0});

  @override
  List<Object> get props => [currentTabIndex];
}

class MovieTabsInitial extends MovieTabsState {}

class MovieTabLoading extends MovieTabsState {
  const MovieTabLoading({required int currentTabIndex}): super(currentTabIndex: currentTabIndex);
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
  final String message;
  final AppErrorType errorType;

  const MovieTabLoadError({
    currentTabIndex,
    required this.message,
    required this.errorType,
  }) : super(currentTabIndex: currentTabIndex);

  @override
  List<Object> get props => [errorType, message];
}
