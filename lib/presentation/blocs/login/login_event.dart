part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUserEvent extends LoginEvent {
  final String username, password;

  const LoginUserEvent({
    this.username,
    this.password,
  });

  @override
  List<Object> get props => [username, password];
}

class LogoutUserEvent extends LoginEvent {}