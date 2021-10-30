import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/usecases/get_trending.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;

  MovieCarouselBloc(this.getTrending) : super(MovieCarouselInitial()) {
    on<MovieCarouselLoadEvent>(_onCarouselLoaded);
  }

  void _onCarouselLoaded(
      MovieCarouselLoadEvent event, Emitter<MovieCarouselState> emit) async {
    final movieEither = await getTrending(NoParams());

    MovieCarouselState state = movieEither.fold(
      (l) => MovieCarouselError(
        message: l.message,
        errorType: l.errorType,
      ),
      (movies) {
        return MovieCarouselLoaded(
          movies: movies,
          defaultIndex: event.defaultIndex,
        );
      },
    );

    emit(state);
  }
}
