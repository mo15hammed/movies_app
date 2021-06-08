import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/repositories/app_repository.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

class GetPreferredLanguage extends UseCase<String, NoParams> {
  final AppRepository appRepository;

  GetPreferredLanguage(this.appRepository);

  @override
  Future<Either<AppError, String>> call(NoParams noParams) async {
    return await appRepository.getPreferredLanguage();
  }

}