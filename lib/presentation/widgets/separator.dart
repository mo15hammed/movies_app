import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/themes/app_theme.dart';

class Separator extends StatelessWidget {
  const Separator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.dimen_5,
      width: Sizes.dimen_100,
      margin: EdgeInsets.symmetric(
        vertical: Sizes.dimen_4.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.dimen_10.r),
        gradient: const LinearGradient(
          colors: [
            AppTheme.violet,
            AppTheme.royalBlue,
          ]
        )
      ),
    );
  }
}
