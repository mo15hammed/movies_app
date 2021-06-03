import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_app/data/models/cast_crew_result_model.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/cast_entity.dart';
import 'package:movies_app/domain/entities/movie_detail_entity.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return Right(movies);
    } on DioError catch (e) {
      if (e.type == DioErrorType.other)
        return Left(
          AppError(errorType: AppErrorType.network),
        );
      return Left(
        AppError(errorType: AppErrorType.api),
      );
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getPopular() async {
    try {
      final movies = await remoteDataSource.getPopular();
      return Right(movies);
    } on DioError catch (e) {
      if (e.type == DioErrorType.other)
        return Left(
          AppError(errorType: AppErrorType.network),
        );
      return Left(
        AppError(errorType: AppErrorType.api),
      );
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getComingSoon() async {
    try {
      final movies = await remoteDataSource.getComingSoon();
      return Right(movies);
    } on DioError catch (e) {
      if (e.type == DioErrorType.other)
        return Left(
          AppError(errorType: AppErrorType.network),
        );
      return Left(
        AppError(errorType: AppErrorType.api),
      );
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getPlayingNow() async {
    try {
      final movies = await remoteDataSource.getPlayingNow();
      return Right(movies);
    } on DioError catch (e) {
      if (e.type == DioErrorType.other)
        return Left(
          AppError(errorType: AppErrorType.network),
        );
      return Left(
        AppError(errorType: AppErrorType.api),
      );
    }
  }

  @override
  Future<Either<AppError, MovieDetailEntity>> getMovieDetail(int id) async {
    try {
      final movie = await remoteDataSource.getMovieDetail(id);
      return Right(movie);
    } on DioError catch(e) {
      if (e.type == DioErrorType.other)
        return Left(
          AppError(errorType: AppErrorType.network),
        );
      return Left(
        AppError(errorType: AppErrorType.api),
      );
    }
  }

  @override
  Future<Either<AppError, List<CastModel>>> getCastCrew(int id) async {
    try {
      final castCrew = await remoteDataSource.getCastCrew(id);
      return Right(castCrew);
    } on DioError catch(e) {
      if (e.type == DioErrorType.other)
        return Left(
          AppError(errorType: AppErrorType.network),
        );
      return Left(
        AppError(errorType: AppErrorType.api),
      );
    }
  }
}
