import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';

abstract class AppRepository {
  Either<AppError, void> updateLanguage(String langCode);
  Either<AppError, String> getPreferredLanguage();
}