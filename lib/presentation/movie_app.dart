import 'package:flutter/material.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:movies_app/presentation/wiredash_app.dart';
import 'journeys/home/home_screen.dart';

class MovieApp extends StatefulWidget {

  const MovieApp({Key? key}) : super(key: key);

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WiredashApp(
      navigatorKey: _navigatorKey,
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          primaryColor: AppColors.vulcan,
          unselectedWidgetColor: AppColors.royalBlue,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: AppColors.royalBlue,
            secondary: AppColors.violet,
          ),
          scaffoldBackgroundColor: AppColors.vulcan,
          textTheme: ThemeText.textTheme,
          appBarTheme: const AppBarTheme(elevation: 0.0),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
