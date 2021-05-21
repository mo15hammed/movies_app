import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies_app/common/constants/languages.dart';
import 'package:movies_app/common/screenutils/screenutils.dart';
import 'package:movies_app/presentation/app_localization.dart';
import 'package:movies_app/presentation/blocs/language/language_bloc.dart';
import 'package:movies_app/presentation/themes/theme_color.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';

import 'journeys/home/home_screen.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();

    return BlocProvider<LanguageBloc>(
      create: (context) => LanguageBloc(),
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is LanguageLoaded) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Movie App',
              theme: ThemeData(
                unselectedWidgetColor: AppColor.royalBlue,
                primaryColor: AppColor.vulcan,
                scaffoldBackgroundColor: AppColor.vulcan,
                accentColor: AppColor.royalBlue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                textTheme: ThemeText.getTextTheme(),
                appBarTheme: const AppBarTheme(elevation: 0),
              ),
              supportedLocales: Languages.languages.map((e) => Locale(e.code)).toList(),
              locale: state.locale,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                AppLocalization.delegate,
              ],
              home: HomeScreen(),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
