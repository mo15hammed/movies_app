import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

class SaveFavoriteMovie extends UseCase<void, MovieEntity> {

  final MovieRepository _movieRepository;

  const SaveFavoriteMovie(this._movieRepository);

  @override
  Future<Either<AppError, void>> call(MovieEntity params) {
    return _movieRepository.saveFavoriteMovie(params);
  }

}