import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo extends StatelessWidget {
  final double? height;

  const Logo({
    Key? key,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/pngs/logo.png',
      color: Colors.white,
      height: height?.h,

    );
  }
}
