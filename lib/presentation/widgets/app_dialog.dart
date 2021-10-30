import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/widgets/button.dart';

class AppDialog extends StatelessWidget {
  final String title, desc, buttonText;
  final Widget? image;

  const AppDialog({
    Key? key,
    required this.title,
    required this.desc,
    required this.buttonText,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: Sizes.dimen_32,
      insetPadding: const EdgeInsets.all(Sizes.dimen_40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.dimen_16.r),
      ),
      child: Container(
        padding: const EdgeInsets.all(Sizes.dimen_24),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor,
              blurRadius: Sizes.dimen_8,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Sizes.dimen_8),
            Text(
              desc,
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Sizes.dimen_16),
            if (image != null) image!,
            if (image != null) const SizedBox(height: Sizes.dimen_16),
            Button(
              text: buttonText,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
