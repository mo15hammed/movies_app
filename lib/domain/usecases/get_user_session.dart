import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/repositories/app_repository.dart';
import 'package:movies_app/domain/repositories/authentication_repository.dart';

abstract class UseCase<Type, Params> {
  Either<AppError, Type> call(Params params);
}
class GetUserSession extends UseCase<String, NoParams> {
  final AuthenticationRepository repository;

  GetUserSession(this.repository);

  @override
  Either<AppError, String> call(NoParams noParams) {
    return repository.getUserSession();
  }
}
