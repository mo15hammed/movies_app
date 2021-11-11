import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/cast_entity.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/video_entity.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>>> getTrending();
  Future<Either<AppError, List<MovieEntity>>> getPopular();
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow();
  Future<Either<AppError, List<MovieEntity>>> getComingSoon();
  Future<Either<AppError, MovieEntity>> getMovieDetails(int id);
  Future<Either<AppError, List<CastEntity>>> getMovieCast(int id);
  Future<Either<AppError, List<VideoEntity>>> getMovieVideos(int id);
  Future<Either<AppError, List<MovieEntity>>> getSearchedMovies(String query);
}
