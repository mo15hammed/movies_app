import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';

part 'movie_backdrop_event.dart';
part 'movie_backdrop_state.dart';

class MovieBackdropBloc extends Bloc<MovieBackdropEvent, MovieBackdropState> {
  MovieBackdropBloc() : super(MovieBackdropInitial()) {
    on<MovieBackdropChangedEvent>(_onMovieBackdropChanged);
  }

  void _onMovieBackdropChanged(
    MovieBackdropChangedEvent event,
    Emitter<MovieBackdropState> emit,
  ) {
    emit(MovieBackdropChanged(event.movie));
  }
}
