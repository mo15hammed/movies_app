import 'package:flutter/material.dart';
import 'package:movies_app/common/screenutils/screenutils.dart';
import 'package:movies_app/presentation/themes/theme_color.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';

import 'journeys/home/home_screen.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        primaryColor: AppColor.vulcan,
        scaffoldBackgroundColor: AppColor.vulcan,
        accentColor: AppColor.royalBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      home: HomeScreen(),
    );
  }
}
