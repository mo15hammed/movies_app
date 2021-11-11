import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/search_params.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

class GetSearchedMovies extends UseCase<List<MovieEntity>, SearchParams> {

  final MovieRepository movieRepository;

  const GetSearchedMovies(this.movieRepository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(SearchParams params) async {
    return await movieRepository.getSearchedMovies(params.query);
  }



}