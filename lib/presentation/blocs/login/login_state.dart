part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginError extends LoginState {
  final String message;
  final AppErrorType errorType;

  const LoginError({
    this.message,
    this.errorType,
  });

  @override
  List<Object> get props => [message, errorType];
}

class LogoutSuccess extends LoginState {}
