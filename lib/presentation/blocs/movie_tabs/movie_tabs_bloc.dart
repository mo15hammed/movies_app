import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/usecases/get_coming_soon.dart';
import 'package:movies_app/domain/usecases/get_playing_now.dart';
import 'package:movies_app/domain/usecases/get_popular.dart';

part 'movie_tabs_event.dart';
part 'movie_tabs_state.dart';

class MovieTabsBloc extends Bloc<MovieTabsEvent, MovieTabsState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;

  MovieTabsBloc({
    required this.getPopular,
    required this.getPlayingNow,
    required this.getComingSoon,
  }) : super(MovieTabsInitial()) {
    on<MovieTabChangedEvent>(_onTabChanged);
  }

  _onTabChanged(
    MovieTabChangedEvent event,
    Emitter<MovieTabsState> emit,
  ) async {
    emit(MovieTabLoading(currentTabIndex: event.currentTabIndex));

    final tabActions = [
      await getPopular(NoParams()),
      await getPlayingNow(NoParams()),
      await getComingSoon(NoParams()),
    ];

    final moviesEither = tabActions[event.currentTabIndex];

    moviesEither.fold(
      (l) => emit(
        MovieTabLoadError(
          currentTabIndex: event.currentTabIndex,
          message: l.message,
          errorType: l.errorType,
        ),
      ),
      (movies) => emit(
        MovieTabLoadSuccess(
          currentTabIndex: event.currentTabIndex,
          movies: movies,
        ),
      ),
    );
  }
}
