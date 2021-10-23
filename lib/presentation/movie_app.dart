import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';

import 'journeys/home/home_screen.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.vulcan,
          scaffoldBackgroundColor: AppColors.vulcan,
          textTheme: ThemeText.textTheme,
          appBarTheme: const AppBarTheme(elevation: 0.0),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
