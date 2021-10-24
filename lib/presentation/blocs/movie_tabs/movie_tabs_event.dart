part of 'movie_tabs_bloc.dart';

abstract class MovieTabsEvent extends Equatable {
  const MovieTabsEvent();

  @override
  List<Object?> get props => [];
}

class MovieTabChangedEvent extends MovieTabsEvent {
  final int currentTabIndex;

  const MovieTabChangedEvent({this.currentTabIndex = 0});

  @override
  List<Object?> get props => [currentTabIndex];
}