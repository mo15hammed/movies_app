import 'dart:io';
import 'package:movies_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_app/data/models/credits_result_model.dart';
import 'package:movies_app/data/models/movie_details_model.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/data/models/videos_result_model.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    return _catchExceptions<List<MovieModel>>(() async {
      return await remoteDataSource.getTrending();
    });
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getPopular() async {
    return _catchExceptions<List<MovieModel>>(() async {
      return await remoteDataSource.getPopular();
    });
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getPlayingNow() async {
    return _catchExceptions<List<MovieModel>>(() async {
      return await remoteDataSource.getPlayingNow();
    });
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getComingSoon() async {
    return _catchExceptions<List<MovieModel>>(() async {
      return await remoteDataSource.getComingSoon();
    });
  }

  @override
  Future<Either<AppError, MovieDetailsModel>> getMovieDetails(int id) async {
    return _catchExceptions<MovieDetailsModel>(() async {
      return await remoteDataSource.getMovieDetails(id);
    });
  }

  @override
  Future<Either<AppError, List<CastModel>>> getMovieCast(int id) async {
    return _catchExceptions<List<CastModel>>(() async {
      return await remoteDataSource.getMovieCast(id);
    });
  }

  @override
  Future<Either<AppError, List<VideoModel>>> getMovieVideos(int id) async {
    return _catchExceptions<List<VideoModel>>(() async {
      return await remoteDataSource.getMovieVideos(id);
    });
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getSearchedMovies(String query) async {
    return _catchExceptions<List<MovieModel>>(() async {
      return await remoteDataSource.getSearchedMovies(query);
    });
  }

  Future<Either<AppError, Type>> _catchExceptions<Type>(
    Future<Type> Function() func,
  ) async {
    try {
      return Right(await func());
    } on SocketException catch (e) {
      return Left(AppError(e.message, AppErrorType.network));
    } on Exception catch (e) {
      return Left(AppError(e.toString(), AppErrorType.api));
    }
  }
}
