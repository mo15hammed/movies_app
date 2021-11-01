import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/movie_params.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

class GetMovieDetails extends UseCase<MovieEntity, MovieParams> {
  final MovieRepository movieRepository;

  const GetMovieDetails(this.movieRepository);

  @override
  Future<Either<AppError, MovieEntity>> call(MovieParams params) async {
    return await movieRepository.getMovieDetails(params.id);
  }
}
