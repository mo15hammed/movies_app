import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabItemWidget extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final bool isSelected;

  const TabItemWidget({
    Key? key,
    required this.title,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isSelected ? () => {} : onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: Sizes.dimen_6.h,
          horizontal: Sizes.dimen_12.w,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(
              width: Sizes.dimen_2,
              color: isSelected ? AppColors.royalBlue : Colors.transparent,
            ),
          ),
        ),
        child: Text(
          title,
          style: isSelected
              ? Theme.of(context).textTheme.royalBlueSubtitle1
              : Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
