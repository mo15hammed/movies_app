import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/login_params.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/usecases/get_user_session.dart';
import 'package:movies_app/domain/usecases/login_user.dart';
import 'package:movies_app/domain/usecases/logout_user.dart';
import 'package:movies_app/presentation/blocs/loading/loading_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser loginUser;
  final LogoutUser logoutUser;
  final GetUserSession getUserSession;
  final LoadingBloc loadingBloc;

  LoginBloc({
    @required this.loginUser,
    @required this.logoutUser,
    @required this.getUserSession,
    @required this.loadingBloc,
  }) : super(LoginInitial(getUserSession(NoParams()).getOrElse(() => null)));

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginUserEvent) {
      loadingBloc.add(StartLoadingEvent());
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
      loadingBloc.add(FinishLoadingEvent());
    } else if (event is LogoutUserEvent) {
      await logoutUser(NoParams());
      yield LogoutSuccess();
    }
  }
}
