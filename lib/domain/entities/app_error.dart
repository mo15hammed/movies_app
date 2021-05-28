import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final String message;
  final AppErrorType errorType;

  const AppError({
    this.message,
    this.errorType = AppErrorType.api,
  });

  @override
  List<Object> get props => [message, errorType];
}

enum AppErrorType { api, network }
