import 'dart:io';
import 'package:movies_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_app/data/models/movie_details_model.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return Right(movies);
    } on SocketException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on Exception catch (e) {
      return Left(AppError(errorType: AppErrorType.api, message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async {
    try {
      final movies = await remoteDataSource.getPopular();
      return Right(movies);
    } on SocketException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on Exception catch (e) {
      return Left(AppError(errorType: AppErrorType.api, message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
    try {
      final movies = await remoteDataSource.getPlayingNow();
      return Right(movies);
    } on SocketException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on Exception catch (e) {
      return Left(AppError(errorType: AppErrorType.api, message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getComingSoon() async {
    try {
      final movies = await remoteDataSource.getComingSoon();
      return Right(movies);
    } on SocketException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on Exception catch (e) {
      return Left(AppError(errorType: AppErrorType.api, message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, MovieDetailsModel>> getMovieDetails(int id) async {
    try {
      final movie = await remoteDataSource.getMovieDetails(id);
      return Right(movie);
    } on SocketException catch (e) {
      return Left(
          AppError(message: e.message, errorType: AppErrorType.network));
    } on Exception catch (e) {
      return Left(AppError(message: e.toString(), errorType: AppErrorType.api));
    }
  }
}
