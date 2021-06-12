import 'package:dartz/dartz.dart';
import 'package:movies_app/data/data_sources/language_local_data_source.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/repositories/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  final LanguageLocalDataSource localDataSource;

  AppRepositoryImpl(this.localDataSource);


  @override
  Either<AppError, String> getPreferredLanguage() {
    try {
      final response = localDataSource.getPreferredLanguage() ?? 'en';
      return Right(response);
    } catch (e) {
      return Left(
        AppError(message: e.toString(), errorType: AppErrorType.database),
      );
    }
  }

  @override
  Either<AppError, void> updateLanguage(String langCode) {
    try {
      final response = localDataSource.updateLanguage(langCode);
      return Right(response);
    } catch (e) {
      return Left(
        AppError(message: e.toString(), errorType: AppErrorType.database),
      );
    }
  }

}