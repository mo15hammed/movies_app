import 'dart:io';
import 'package:movies_app/data/data_sources/local/movie_local_data_source.dart';
import 'package:movies_app/data/data_sources/remote/movie_remote_data_source.dart';
import 'package:movies_app/data/models/credits_result_model.dart';
import 'package:movies_app/data/models/movie_details_model.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/data/models/videos_result_model.dart';
import 'package:movies_app/data/tabels/movie_table.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  final MovieLocalDataSource localDataSource;

  MovieRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    return _catchRemoteExceptions<List<MovieModel>>(() async {
      return await remoteDataSource.getTrending();
    });
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getPopular() async {
    return _catchRemoteExceptions<List<MovieModel>>(() async {
      return await remoteDataSource.getPopular();
    });
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getPlayingNow() async {
    return _catchRemoteExceptions<List<MovieModel>>(() async {
      return await remoteDataSource.getPlayingNow();
    });
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getComingSoon() async {
    return _catchRemoteExceptions<List<MovieModel>>(() async {
      return await remoteDataSource.getComingSoon();
    });
  }

  @override
  Future<Either<AppError, MovieDetailsModel>> getMovieDetails(int id) async {
    return _catchRemoteExceptions<MovieDetailsModel>(() async {
      return await remoteDataSource.getMovieDetails(id);
    });
  }

  @override
  Future<Either<AppError, List<CastModel>>> getMovieCast(int id) async {
    return _catchRemoteExceptions<List<CastModel>>(() async {
      return await remoteDataSource.getMovieCast(id);
    });
  }

  @override
  Future<Either<AppError, List<VideoModel>>> getMovieVideos(int id) async {
    return _catchRemoteExceptions<List<VideoModel>>(() async {
      return await remoteDataSource.getMovieVideos(id);
    });
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getSearchedMovies(
      String query) async {
    return _catchRemoteExceptions<List<MovieModel>>(() async {
      return await remoteDataSource.getSearchedMovies(query);
    });
  }

  @override
  Future<Either<AppError, bool>> checkIfMovieIsFavorite(int id) async {
    return await _catchLocalExceptions<bool>(() async {
      return await localDataSource.checkIfMovieIsFavorite(id);
    });
  }

  @override
  Future<Either<AppError, void>> deleteFavoriteMovie(int id) async {
    return await _catchLocalExceptions<void>(() async {
      await localDataSource.deleteMovie(id);
    });
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getFavoriteMovies() async {
    return await _catchLocalExceptions<List<MovieEntity>>(() async {
      return await localDataSource.getMovies();
    });
  }

  @override
  Future<Either<AppError, void>> saveFavoriteMovie(MovieEntity movie) async {
    return await _catchLocalExceptions<void>(() async {
      await localDataSource.saveMovie(MovieTable.fromEntity(movie));
    });
  }

  Future<Either<AppError, Type>> _catchLocalExceptions<Type>(
    Future<Type> Function() func,
  ) async {
    try {
      return Right(await func());
    } catch (e) {
      return Left(AppError(e.toString(), AppErrorType.database));
    }
  }

  Future<Either<AppError, Type>> _catchRemoteExceptions<Type>(
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
