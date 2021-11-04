import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/cast_entity.dart';
import 'package:movies_app/domain/entities/movie_params.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

class GetMovieCast extends UseCase<List<CastEntity>, MovieParams> {
  final MovieRepository movieRepository;

  const GetMovieCast(this.movieRepository);

  @override
  Future<Either<AppError, List<CastEntity>>> call(MovieParams params) {
    return movieRepository.getMovieCast(params.id);
  }
}
