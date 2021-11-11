import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/search_params.dart';
import 'package:movies_app/domain/usecases/get_searched_movies.dart';

part 'movie_search_event.dart';
part 'movie_search_state.dart';

class MovieSearchBloc extends Bloc<MovieSearchEvent, MovieSearchState> {
  final GetSearchedMovies getSearchedMovies;

  MovieSearchBloc(this.getSearchedMovies) : super(MovieSearchInitial()) {
    on<SearchQueryChangedEvent>(_onSearchQueryChanged);
  }

  void _onSearchQueryChanged(
    SearchQueryChangedEvent event,
    Emitter<MovieSearchState> emit,
  ) async {
    emit(MovieSearchLoading());

    final moviesEither =
        await getSearchedMovies(SearchParams(query: event.query));

    moviesEither.fold(
      (l) => emit(MovieSearchLoadError(
        query: event.query,
        message: l.message,
        errorType: l.errorType,
      )),
      (movies) => emit(MovieSearchLoadSuccess(movies)),
    );
  }
}
