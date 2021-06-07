import 'package:dartz/dartz.dart';
import 'package:movies_app/data/data_sources/language_local_data_source.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/repositories/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  final LanguageLocalDataSource localDataSource;

  AppRepositoryImpl(this.localDataSource);


  @override
  Future<Either<AppError, String>> getPreferredLanguage() async {
    try {
      final response = await localDataSource.getPreferredLanguage() ?? 'en';
      return Right(response);
    } catch (e) {
      return Left(
        AppError(message: e.toString(), errorType: AppErrorType.database),
      );
    }
  }

  @override
  Future<Either<AppError, void>> updateLanguage(String langCode) async {
    try {
      final response = await localDataSource.updateLanguage(langCode);
      return Right(response);
    } catch (e) {
      return Left(
        AppError(message: e.toString(), errorType: AppErrorType.database),
      );
    }
  }

}