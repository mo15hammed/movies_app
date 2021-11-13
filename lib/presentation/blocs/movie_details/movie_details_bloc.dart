import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/movie_params.dart';
import 'package:movies_app/domain/usecases/get_movie_details.dart';
import 'package:movies_app/presentation/blocs/loading/loading_bloc.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetails getMovieDetails;
  final LoadingBloc loadingBloc;

  MovieDetailsBloc({
    required this.getMovieDetails,
    required this.loadingBloc,
  }) : super(MovieDetailsInitial()) {
    on<MovieDetailsLoadEvent>(_onMovieDetailLoad);
  }

  void _onMovieDetailLoad(
      MovieDetailsLoadEvent event, Emitter<MovieDetailsState> emit) async {
    // emit(MovieDetailsLoading());
    loadingBloc.add(StartLoadingEvent());

    final movieEither = await getMovieDetails(MovieParams(event.movieId));

    movieEither.fold(
      (l) {
        emit(MovieDetailsError(
          message: l.message,
          errorType: l.errorType,
        ));
      },
      (movie) {
        emit(MovieDetailsSuccess(movie));
      },
    );

    loadingBloc.add(FinishLoadingEvent());

  }
}
