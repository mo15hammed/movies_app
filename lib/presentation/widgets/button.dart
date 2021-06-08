import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/themes/theme_color.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;

  const Button({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.violet,
            AppColor.royalBlue,
          ],
        ),
        borderRadius: BorderRadius.circular(Sizes.dimen_24.w),
      ),
      height: Sizes.dimen_44.h,
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_6.h),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        splashColor: AppColor.royalBlue.withOpacity(0.7),
        highlightColor: AppColor.violet.withOpacity(0.7),
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
        minWidth: Sizes.dimen_140.w,
        child: Text(
          text,
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
