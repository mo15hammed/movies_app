import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_params.dart';
import 'package:movies_app/domain/entities/video_entity.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

class GetMovieVideos extends UseCase<List<VideoEntity>, MovieParams> {
  final MovieRepository movieRepository;

  const GetMovieVideos(this.movieRepository);

  @override
  Future<Either<AppError, List<VideoEntity>>> call(MovieParams params) {
    return movieRepository.getMovieVideos(params.id);
  }
}
