import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/repositories/authentication_repository.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

class LogoutUser extends UseCase<void, NoParams> {
  final AuthenticationRepository _repository;

  LogoutUser(this._repository);

  @override
  Future<Either<AppError, void>> call(NoParams params) async {
    return await _repository.logoutUser();
  }

}