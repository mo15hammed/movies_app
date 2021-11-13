import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_theme.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextStyle get _whiteHeadline6 => _poppinsTextTheme.headline6!.copyWith(
        fontSize: Sizes.dimen_20.sp,
        color: Colors.white,
      );

  static TextStyle get _whiteHeadline5 => _poppinsTextTheme.headline5!.copyWith(
        fontSize: Sizes.dimen_24.sp,
        color: Colors.white,
      );

  static TextStyle get _whiteSubtitle1 => _poppinsTextTheme.subtitle1!.copyWith(
        fontSize: Sizes.dimen_16.sp,
        color: Colors.white,
      );

  static TextStyle get _whiteBodyText2 => _poppinsTextTheme.bodyText2!.copyWith(
        fontSize: Sizes.dimen_14.sp,
        color: Colors.white,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle get _whiteButton => _poppinsTextTheme.button!.copyWith(
        fontSize: Sizes.dimen_14.sp,
        color: Colors.white,
      );

  static TextStyle get _vulcanHeadline6 =>
      _poppinsTextTheme.headline6!.copyWith(
        fontSize: Sizes.dimen_20.sp,
        color: AppTheme.vulcan,
      );

  static TextStyle get _vulcanHeadline5 =>
      _poppinsTextTheme.headline5!.copyWith(
        fontSize: Sizes.dimen_24.sp,
        color: AppTheme.vulcan,
      );

  static TextStyle get _vulcanSubtitle1 =>
      _poppinsTextTheme.subtitle1!.copyWith(
        fontSize: Sizes.dimen_16.sp,
        color: AppTheme.vulcan,
      );

  static TextStyle get _vulcanBodyText2 =>
      _poppinsTextTheme.bodyText2!.copyWith(
        fontSize: Sizes.dimen_14.sp,
        color: AppTheme.vulcan,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextTheme get darkTextTheme => TextTheme(
        headline5: _whiteHeadline5,
        headline6: _whiteHeadline6,
        subtitle1: _whiteSubtitle1,
        bodyText2: _whiteBodyText2,
        button: _whiteButton,
      );

  static TextTheme get lightTextTheme => TextTheme(
        headline5: _vulcanHeadline5,
        headline6: _vulcanHeadline6,
        subtitle1: _vulcanSubtitle1,
        bodyText2: _vulcanBodyText2,
        button: _whiteButton,
      );
}

extension ThemeTextExtension on TextTheme {
  TextStyle get royalBlueHeadline6 => headline6!.copyWith(
        color: AppTheme.royalBlue,
      );

  TextStyle get royalBlueSubtitle1 => subtitle1!.copyWith(
        color: AppTheme.royalBlue,
        fontWeight: FontWeight.w600,
      );

  TextStyle get greySubtitle1 => subtitle1!.copyWith(
        color: Colors.grey,
      );

  TextStyle get vulcanBodyText2 => bodyText2!.copyWith(
        color: AppTheme.vulcan,
        fontWeight: FontWeight.w600,
      );

  TextStyle get greyCaption => caption!.copyWith(
        color: Colors.grey,
      );
}
