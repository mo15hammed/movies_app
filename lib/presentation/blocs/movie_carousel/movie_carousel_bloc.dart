import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/usecases/get_trending.dart';
import 'package:movies_app/presentation/blocs/loading/loading_bloc.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final LoadingBloc loadingBloc;
  final GetTrending getTrending;

  MovieCarouselBloc({
    required this.getTrending,
    required this.loadingBloc,
  }) : super(MovieCarouselInitial()) {
    on<MovieCarouselLoadEvent>(_onLoadCarousel);
  }

  void _onLoadCarousel(
    MovieCarouselLoadEvent event,
    Emitter<MovieCarouselState> emit,
  ) async {
    loadingBloc.add(StartLoadingEvent());

    final movieEither = await getTrending(NoParams());

    movieEither.fold(
      (l) => emit(MovieCarouselError(
        message: l.message,
        errorType: l.errorType,
      )),
      (movies) {
        emit(MovieCarouselLoaded(
          movies: movies,
          defaultIndex: event.defaultIndex,
        ));
      },
    );

    loadingBloc.add(FinishLoadingEvent());
  }
}
