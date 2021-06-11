import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/data/core/unauthorized_exception.dart';
import 'package:movies_app/data/data_sources/authentication_local_data_source.dart';
import 'package:movies_app/data/data_sources/authentication_remote_data_source.dart';
import 'package:movies_app/data/models/request_token_model.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationRemoteDataSource _remoteDataSource;
  final AuthenticationLocalDataSource _localDataSource;

  AuthenticationRepositoryImpl(this._remoteDataSource, this._localDataSource);

  Future<Either<AppError, RequestTokenModel>> _getRequestToken() async {
    try {
      final response = await _remoteDataSource.getRequestToken();
      return Right(response);
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
  Future<Either<AppError, bool>> loginUser(Map<String, dynamic> params) async {
    final requestTokenEitherRes = await _getRequestToken();
    final token = requestTokenEitherRes.getOrElse(() => null)?.requestToken ?? '';

    try {
      params.putIfAbsent('request_token', () => token);
      final validateWithLoginToken = await _remoteDataSource.validateWithLogin(params);

      final sessionId = await _remoteDataSource.createSession(validateWithLoginToken.toJson());
      print('loginUser(): sessionId::: ' + sessionId);
      if (sessionId != null) {
        _localDataSource.saveSessionId(sessionId);
        return Right(true);
      } else {
        return Left(
          AppError(message: 'SESSION_DENIED', errorType: AppErrorType.sessionDenied),
        );
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        return Left(
          AppError(message: e.message, errorType: AppErrorType.unauthorized),
        );
      } else if (e.type == DioErrorType.other) {
        return Left(
          AppError(message: e.message, errorType: AppErrorType.network),
        );
      }
      return Left(
        AppError(message: e.message, errorType: AppErrorType.api),
      );
    } on UnauthorizedException {
      return Left(AppError(message: 'UNAUTHORIZED', errorType: AppErrorType.unauthorized));
    }
  }

  @override
  Future<Either<AppError, void>> logoutUser() async {
    final sessionId = await _localDataSource.getSessionId();
    await Future.wait([
      _remoteDataSource.deleteSession(sessionId),
      _localDataSource.deleteSessionId(),
    ]);
    print(await _localDataSource.getSessionId());
    return Right(Unit);
  }
}
