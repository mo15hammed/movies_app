import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_params.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

class CheckIfMovieIsFavorite extends UseCase<bool, MovieParams> {

  final MovieRepository _movieRepository;

  const CheckIfMovieIsFavorite(this._movieRepository);

  @override
  Future<Either<AppError, bool>> call(MovieParams params) {
    return _movieRepository.checkIfMovieIsFavorite(params.id);
  }

}