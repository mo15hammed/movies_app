import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/presentation/themes/theme_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelFieldWidget extends StatelessWidget {
  final String label, hint;
  final TextEditingController controller;
  final bool isPassword;
  final OutlineInputBorder _enabledBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.circular(Sizes.dimen_16.r),
  );

  LabelFieldWidget({
    Key key,
    @required this.label,
    @required this.hint,
    @required this.controller,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          focusedBorder: _enabledBorder.copyWith(
            borderSide: BorderSide(
              color: AppColor.royalBlue,
            ),
          ),
          border: _enabledBorder),
      obscureText: isPassword,
      controller: controller,
      validator: (value) {
        if (value.isEmpty) {
          return 'Hello';
        }
        return null;
      },
    );
  }
}
