import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/movie_params.dart';
import 'package:movies_app/domain/usecases/get_movie_details.dart';
import 'package:movies_app/presentation/blocs/loading/loading_cubit.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetails getMovieDetails;
  final LoadingCubit loadingCubit;

  MovieDetailsBloc({
    required this.getMovieDetails,
    required this.loadingCubit,
  }) : super(MovieDetailsInitial()) {
    on<MovieDetailsLoadEvent>(_onMovieDetailLoad);
  }

  void _onMovieDetailLoad(
      MovieDetailsLoadEvent event, Emitter<MovieDetailsState> emit) async {
    loadingCubit.show();

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

    loadingCubit.hide();

  }
}
