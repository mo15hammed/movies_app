import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/presentation/themes/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool expanded;

  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
    this.expanded = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: expanded ? double.infinity : null,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppTheme.violet,
            AppTheme.royalBlue,
          ],
        ),
        borderRadius: BorderRadius.circular(Sizes.dimen_20.r),
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const StadiumBorder(),
        padding: EdgeInsets.symmetric(
          vertical: Sizes.dimen_12.h,
          horizontal: Sizes.dimen_16.w,
        ),
        splashColor: Theme.of(context).colorScheme.secondary,
        highlightColor: Theme.of(context).colorScheme.secondary,
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.button,
        ),
        // color: Colors.red,
      ),
    );
  }
}
