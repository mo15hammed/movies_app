import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies_app/common/constants/languages.dart';
import 'package:movies_app/common/screenutils/screenutils.dart';
import 'package:movies_app/di/get_it.dart';
import 'package:movies_app/presentation/app_localization.dart';
import 'package:movies_app/presentation/blocs/language/language_bloc.dart';
import 'package:movies_app/presentation/routes.dart';
import 'package:movies_app/presentation/themes/theme_color.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';
import 'package:movies_app/presentation/wiredash_app.dart';

import 'custom_page_route_builders/slide_vertical_page_route_builder.dart';

class MovieApp extends StatelessWidget {
  final _navigationKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();

    return BlocProvider<LanguageBloc>(
      create: (context) => getItInstance<LanguageBloc>()..add(LoadPreferredLanguageEvent()),
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is LanguageLoaded) {
            return WiredashApp(
              navigationKey: _navigationKey,
              languageCode: state.locale.languageCode,
              child: MaterialApp(
                navigatorKey: _navigationKey,
                debugShowCheckedModeBanner: false,
                title: 'Movie App',
                theme: ThemeData(
                  brightness: Brightness.dark,
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
                // home: HomeScreen(),
                builder: (context, child) {
                  return child;
                },
                // initialRoute: RouteList.home,
                onGenerateRoute: (RouteSettings settings) {
                  final routes = Routes.getRoutes(settings);
                  final WidgetBuilder builder = routes[settings.name];

                  return SlideVerticalPageRouteBuilder(builder: builder, settings: settings);
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
