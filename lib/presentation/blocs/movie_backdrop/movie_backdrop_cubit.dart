import 'package:bloc/bloc.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';

class MovieBackdropCubit extends Cubit<MovieEntity?> {
  MovieBackdropCubit() : super(null);

  void changeMovieBackdrop(MovieEntity movie) => emit(movie);
}
