import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/movie_search_params.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

class SearchMovies extends UseCase<List<MovieEntity>, MovieSearchParams> {
  final MovieRepository repository;

  SearchMovies(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(MovieSearchParams movieSearchParams) async {
    return await repository.getSearchMovies(movieSearchParams.query);
  }
}