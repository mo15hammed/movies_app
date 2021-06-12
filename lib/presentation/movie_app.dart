import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constants/languages.dart';
import 'package:movies_app/common/constants/route_constants.dart';
import 'package:movies_app/di/get_it.dart';
import 'package:movies_app/presentation/app_localization.dart';
import 'package:movies_app/presentation/blocs/language/language_bloc.dart';
import 'package:movies_app/presentation/blocs/loading/loading_bloc.dart';
import 'package:movies_app/presentation/blocs/loading/loading_bloc.dart';
import 'package:movies_app/presentation/blocs/login/login_bloc.dart';
import 'package:movies_app/presentation/journeys/loading/loading_screen.dart';
import 'package:movies_app/presentation/routes.dart';
import 'package:movies_app/presentation/themes/theme_color.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';
import 'package:movies_app/presentation/wiredash_app.dart';

import 'custom_page_route_builders/slide_vertical_page_route_builder.dart';

class MovieApp extends StatelessWidget {
  final String language;
  final String sessionId;
  MovieApp({
    Key key,
    this.language,
    this.sessionId,
  }) : super(key: key);

  final _navigationKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init();

    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>.value(value: getItInstance<LanguageBloc>()),
        BlocProvider<LoadingBloc>.value(value: getItInstance<LoadingBloc>()),
        BlocProvider<LoginBloc>.value(value: getItInstance<LoginBloc>()),
      ],
      child: ScreenUtilInit(
        designSize: Size(414, 896),
        builder: () => BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            print(state);
            if (state is LanguageLoaded) {
              return MaterialApp(
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
                  textSelectionTheme: TextSelectionThemeData(
                    cursorColor: AppColor.royalBlue,
                    selectionColor: AppColor.royalBlue,
                    selectionHandleColor: AppColor.royalBlue,
                  ),
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
                  return WiredashApp(
                    navigationKey: _navigationKey,
                    languageCode: state.locale.languageCode,
                    child: LoadingScreen(screen: child),
                  );
                },
                // initialRoute: RouteList.home,
                onGenerateRoute: (RouteSettings settings) {
                  final routes = Routes.getRoutes(settings);
                  final WidgetBuilder builder = routes[settings.name];
                  return SlideVerticalPageRouteBuilder(builder: builder, settings: settings);
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
