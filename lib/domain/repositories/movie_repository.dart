import 'package:dartz/dartz.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/domain/entities/app_error.dart';

abstract class MovieRepository {
  Future<Either<AppError ,List<MovieModel>>> getTrending();
  Future<Either<AppError ,List<MovieModel>>> getPopular();
  Future<Either<AppError ,List<MovieModel>>> getComingSoon();
  Future<Either<AppError ,List<MovieModel>>> getPlayingNow();
}