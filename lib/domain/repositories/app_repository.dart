import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';

abstract class AppRepository {
  Future<Either<AppError, void>> updateLanguage(String langCode);
  Future<Either<AppError, String>> getPreferredLanguage();
}