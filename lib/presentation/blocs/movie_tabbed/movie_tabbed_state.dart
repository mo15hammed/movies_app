part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedState extends Equatable {
  final int currentTabIndex;

  const MovieTabbedState({this.currentTabIndex});

  @override
  List<Object> get props => [currentTabIndex];
}

class MovieTabbedInitial extends MovieTabbedState {}

class MovieTabLoading extends MovieTabbedState {
  const MovieTabLoading({
    int currentTabIndex,
  }) : super(currentTabIndex: currentTabIndex);
}

class MovieTabChanged extends MovieTabbedState {
  final List<MovieEntity> movies;

  const MovieTabChanged({int currentTabIndex, this.movies})
      : super(currentTabIndex: currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex, movies];
}

class MovieTabLoadError extends MovieTabbedState {
  final String message;
  final AppErrorType errorType;

  const MovieTabLoadError({
    int currentTabIndex,
    this.message,
    this.errorType,
  }) : super(currentTabIndex: currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex, message, errorType];
}
