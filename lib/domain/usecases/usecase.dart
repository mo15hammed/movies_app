import 'package:movies_app/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {

  const UseCase();

  Future<Either<AppError, Type>> call(Params params);
}