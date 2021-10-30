import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/api_constants.dart';
import 'package:movies_app/di/get_it.dart';
import 'package:movies_app/presentation/blocs/language/language_bloc.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'journeys/home/home_screen.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primaryColor: AppColors.vulcan,
        unselectedWidgetColor: AppColors.royalBlue,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.royalBlue,
        ),
        scaffoldBackgroundColor: AppColors.vulcan,
        textTheme: ThemeText.textTheme,
        appBarTheme: const AppBarTheme(elevation: 0.0),
      ),
      home: const HomeScreen(),
    );
  }
}
