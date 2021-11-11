import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_params.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

class DeleteFavoriteMovie extends UseCase<void, MovieParams> {

  final MovieRepository _movieRepository;

  const DeleteFavoriteMovie(this._movieRepository);

  @override
  Future<Either<AppError, void>> call(MovieParams params) {
    return _movieRepository.deleteFavoriteMovie(params.id);
  }

}