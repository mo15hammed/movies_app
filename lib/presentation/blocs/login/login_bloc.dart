import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/login_params.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/usecases/login_user.dart';
import 'package:movies_app/domain/usecases/logout_user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser loginUser;
  final LogoutUser logoutUser;

  LoginBloc({
    @required this.loginUser,
    @required this.logoutUser,
  }) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginUserEvent) {
      final eitherLogin = await loginUser(LoginParams(
        username: event.username,
        password: event.password,
      ));

      yield eitherLogin.fold((l) {
        return LoginError(
          message: l.message,
          errorType: l.errorType,
        );
      }, (r) => LoginSuccess());
    } else if (event is LogoutUserEvent) {
      await logoutUser(NoParams());
      yield LogoutSuccess();
    }
  }
}
