import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/presentation/themes/theme_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextStyle get _whiteHeadline5 => _poppinsTextTheme.headline5.copyWith(
        fontSize: Sizes.dimen_36.sp,
        color: Colors.white,
      );

  static TextStyle get _whiteHeadline6 => _poppinsTextTheme.headline6.copyWith(
        fontSize: Sizes.dimen_28.sp,
        color: Colors.white,
        height: 1.2,
      );

  static TextStyle get _whiteSubtitle1 => _poppinsTextTheme.subtitle1.copyWith(
        fontSize: Sizes.dimen_18.sp,
        color: Colors.white,
      );

  static TextStyle get _whiteBodyText1 => _poppinsTextTheme.bodyText1.copyWith(
        fontSize: Sizes.dimen_24.sp,
        color: Colors.white,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.2,
      );

  static TextStyle get _whiteBodyText2 => _poppinsTextTheme.bodyText2.copyWith(
        fontSize: Sizes.dimen_16.sp,
        color: Colors.white,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle get _whiteButton => _poppinsTextTheme.button.copyWith(
        fontSize: Sizes.dimen_16.sp,
        color: Colors.white,
        // height: 1
      );

  static getTextTheme() => TextTheme(
        headline5: _whiteHeadline5,
        headline6: _whiteHeadline6,
        subtitle1: _whiteSubtitle1,
        bodyText1: _whiteBodyText1,
        bodyText2: _whiteBodyText2,
        button: _whiteButton,
      );
}

extension ThemeTextExtension on TextTheme {
  TextStyle get royalBlueSubtitle1 => subtitle1.copyWith(
        color: AppColor.royalBlue,
        fontWeight: FontWeight.w600,
      );

  TextStyle get greySubtitle1 => subtitle1.copyWith(
        color: Colors.grey,
      );

  TextStyle get orangeSubtitle2 => subtitle2.copyWith(
        color: Colors.deepOrange,
      );

  TextStyle get greySubtitle2 => subtitle2.copyWith(
        color: Colors.grey,
      );

  TextStyle get violetSubtitle1 => subtitle1.copyWith(
        color: AppColor.violet,
      );

  TextStyle get vulcanBodyText2 =>
      bodyText2.copyWith(color: AppColor.vulcan, fontWeight: FontWeight.bold);
}
