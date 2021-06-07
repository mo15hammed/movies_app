import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

class SaveFavMovie extends UseCase<void, MovieEntity> {
  final MovieRepository movieRepository;

  SaveFavMovie(this.movieRepository);

  @override
  Future<Either<AppError, void>> call(MovieEntity movieEntity) async {
    return await movieRepository.saveFavMovies(movieEntity);
  }
}
