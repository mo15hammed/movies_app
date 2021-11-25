import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/usecases/get_coming_soon.dart';
import 'package:movies_app/domain/usecases/get_playing_now.dart';
import 'package:movies_app/domain/usecases/get_popular.dart';

part 'movie_tabs_state.dart';

class MovieTabsCubit extends Cubit<MovieTabsState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;

  MovieTabsCubit({
    required this.getPopular,
    required this.getPlayingNow,
    required this.getComingSoon,
  }) : super(MovieTabsInitial());

  void changeMovieTab({index = 0}) async {
    emit(MovieTabLoading(currentTabIndex: index));

    final tabActions = [
      await getPopular(NoParams()),
      await getPlayingNow(NoParams()),
      await getComingSoon(NoParams()),
    ];

    final moviesEither = tabActions[index];

    moviesEither.fold(
          (l) => emit(
        MovieTabLoadError(
          currentTabIndex: index,
          message: l.message,
          errorType: l.errorType,
        ),
      ),
          (movies) => emit(
        MovieTabLoadSuccess(
          currentTabIndex: index,
          movies: movies,
        ),
      ),
    );
  }
}
