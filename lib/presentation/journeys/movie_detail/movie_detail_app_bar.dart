import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/common/extensions/size_extensions.dart';

class MovieDetailAppBar extends StatelessWidget {
  const MovieDetailAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: Sizes.dimen_12.w,
          ),
        ),
        Icon(
          Icons.favorite_border,
          color: Colors.white,
          size: Sizes.dimen_12.w,
        ),
      ],
    );

  }
}
