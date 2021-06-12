import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/movie_search_params.dart';
import 'package:movies_app/domain/usecases/search_movies.dart';
import 'package:movies_app/presentation/blocs/loading/loading_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMovies searchMovies;
  final LoadingBloc loadingBloc;

  SearchBloc({
    @required this.searchMovies,
    @required this.loadingBloc,
  }) : super(SearchInitial());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is LoadSearchMoviesEvent) {
      if (event.query.length >= 1) {
        loadingBloc.add(StartLoadingEvent());
        yield SearchLoading();
        Either<AppError, List<MovieEntity>> eitherSearch =
        await searchMovies(MovieSearchParams(query: event.query));

        yield eitherSearch.fold(
              (l) => SearchError(
            message: l.message,
            errorType: l.errorType,
          ),
              (movies) => SearchSuccess(movies),
        );
        loadingBloc.add(FinishLoadingEvent());
      }
    }
  }
}
