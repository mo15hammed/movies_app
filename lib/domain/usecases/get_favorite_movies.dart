import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

class GetFavoriteMovies extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository _movieRepository;

  const GetFavoriteMovies(this._movieRepository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams params) {
    return _movieRepository.getFavoriteMovies();
  }
}
