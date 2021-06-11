import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/login_params.dart';
import 'package:movies_app/domain/repositories/authentication_repository.dart';
import 'package:movies_app/domain/usecases/usecase.dart';

class LoginUser extends UseCase<bool, LoginParams> {
  final AuthenticationRepository _repository;

  LoginUser(this._repository);

  @override
  Future<Either<AppError, bool>> call(LoginParams params) async {
    return await _repository.loginUser(params.toJson());
  }

}