import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/themes/theme_color.dart';
import 'package:movies_app/presentation/widgets/button.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String desc;
  final String buttonText;
  final Widget image;

  const AppDialog({
    Key key,
    @required this.title,
    @required this.desc,
    @required this.buttonText,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.vulcan,
      elevation: Sizes.dimen_32,
      insetPadding: EdgeInsets.all(Sizes.dimen_48.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.dimen_18.w),
      ),
      child: Container(
        padding: EdgeInsetsDirectional.only(
          top: Sizes.dimen_16.h,
          bottom: Sizes.dimen_16.h,
          start: Sizes.dimen_16.w,
          end: Sizes.dimen_16.w,
        ),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: AppColor.vulcan,
            blurRadius: Sizes.dimen_16,
          ),
        ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              desc,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            if (image != null) Padding(
              padding: EdgeInsets.symmetric(vertical: Sizes.dimen_12.h),
              child: image,
            ),
            Button(
              text: buttonText,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
