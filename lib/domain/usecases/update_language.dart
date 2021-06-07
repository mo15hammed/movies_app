import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/repositories/app_repository.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

class UpdateLanguage extends UseCase<void, String> {
  final AppRepository appRepository;

  UpdateLanguage(this.appRepository);

  @override
  Future<Either<AppError, void>> call(String langCode) async {
    return await appRepository.updateLanguage(langCode);
  }

}