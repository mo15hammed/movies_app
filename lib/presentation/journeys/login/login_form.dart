import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constants/route_constants.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/common/constants/translation_constants.dart';
import 'package:movies_app/common/extensions/string_extensions.dart';
import 'package:movies_app/di/get_it.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/presentation/blocs/login/login_bloc.dart';
import 'package:movies_app/presentation/widgets/button.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';
import 'label_field_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _usernameCtrl, _passwordCtrl;

  @override
  void initState() {
    super.initState();
    _usernameCtrl = TextEditingController();
    _passwordCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _usernameCtrl?.dispose();
    _passwordCtrl?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Sizes.dimen_32.h,
        horizontal: Sizes.dimen_20.w,
      ),
      child: Column(
        children: [
          Text(
            TranslationConsts.loginToMovieApp.t(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: Sizes.dimen_18.h),
          LabelFieldWidget(
            label: TranslationConsts.username.t(context),
            hint: TranslationConsts.enterTMDbUsername.t(context),
            controller: _usernameCtrl,
          ),
          SizedBox(height: Sizes.dimen_14.h),
          LabelFieldWidget(
            label: TranslationConsts.password.t(context),
            hint: TranslationConsts.enterPassword.t(context),
            controller: _passwordCtrl,
            isPassword: true,
          ),
          SizedBox(height: Sizes.dimen_14.h),
          BlocConsumer<LoginBloc, LoginState>(
            listenWhen: (previous, current) => current is LoginSuccess,
            buildWhen: (previous, current) => current is LoginError,
            listener: (context, state) {
              if (state is LoginSuccess) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteList.home,
                  (route) => false,
                );
              }
            },
            builder: (context, state) {
              print(state);
              if (state is LoginError)
                return Padding(
                  padding: EdgeInsets.only(bottom: Sizes.dimen_8.h),
                  child: Text(
                    AppError.getMsgByErrorType(state.errorType).t(context),
                    style: Theme.of(context).textTheme.orangeSubtitle2,
                  ),
                );
              return const SizedBox.shrink();
            },
          ),
          Button(
            text: TranslationConsts.signIn.t(context),
            onPressed: () {
              if (_usernameCtrl.text.isNotEmpty && _passwordCtrl.text.isNotEmpty) {
                getItInstance<LoginBloc>().add(
                  LoginUserEvent(
                    username: _usernameCtrl.text,
                    password: _passwordCtrl.text,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
