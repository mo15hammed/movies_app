import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/repositories/app_repository.dart';

abstract class UseCase<Type, Params> {
  Either<AppError, Type> call(Params params);
}
class GetPreferredLanguage extends UseCase<String, NoParams> {
  final AppRepository appRepository;

  GetPreferredLanguage(this.appRepository);

  @override
  Either<AppError, String> call(NoParams noParams) {
    return appRepository.getPreferredLanguage();
  }
}
