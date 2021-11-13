import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTheme {
  static const Color vulcan = Color(0xFF141221);
  static const Color royalBlue = Color(0xFF604FEF);
  static const Color violet = Color(0xFFA74DBC);

  static ColorScheme darkColorScheme = ColorScheme.fromSwatch().copyWith(
    background: vulcan,
    primary: royalBlue,
    onPrimary: Colors.white,
    onBackground: Colors.white,
    secondary: violet,
  );

  static ColorScheme lightColorScheme = ColorScheme.fromSwatch().copyWith(
    background: Colors.white,
    primary: royalBlue,
    onPrimary: Colors.grey[200],
    onBackground: vulcan,
    secondary: violet,

  );

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: darkColorScheme.background,
      unselectedWidgetColor: darkColorScheme.primary,
      scaffoldBackgroundColor: darkColorScheme.background,
      colorScheme: darkColorScheme,
      textTheme: ThemeText.darkTextTheme,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: Colors.transparent,
        titleTextStyle: ThemeText.lightTextTheme.headline6,
        iconTheme: IconThemeData(
          color: darkColorScheme.onBackground,
          size: Sizes.dimen_28.sp,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: lightColorScheme.background,
      unselectedWidgetColor: lightColorScheme.primary,
      scaffoldBackgroundColor: lightColorScheme.background,
      colorScheme: lightColorScheme,
      textTheme: ThemeText.lightTextTheme,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: Colors.transparent,
        titleTextStyle: ThemeText.lightTextTheme.headline6,
        iconTheme: IconThemeData(
          color: lightColorScheme.onBackground,
          size: Sizes.dimen_28.sp,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
      ),
    );
  }
}
