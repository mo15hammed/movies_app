import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/repositories/app_repository.dart';

abstract class UseCase<Type, Params> {
  Either<AppError, Type> call(Params params);
}

class UpdateLanguage extends UseCase<void, String> {
  final AppRepository appRepository;

  UpdateLanguage(this.appRepository);

  @override
  Either<AppError, void> call(String langCode) {
    return appRepository.updateLanguage(langCode);
  }

}