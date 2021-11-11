import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final String message;
  final AppErrorType errorType;

  const AppError(
    this.message,
    this.errorType,
  );

  @override
  List<Object?> get props => [errorType, message];

  @override
  bool? get stringify => true;
}

enum AppErrorType {
  api,
  network,
  database,
}
