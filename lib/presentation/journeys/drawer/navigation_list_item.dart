import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constants.dart';

class NavigationListItem extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final double contentPadding;

  const NavigationListItem(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.contentPadding = Sizes.dimen_16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ListTile(
        contentPadding:
            EdgeInsets.symmetric(horizontal: contentPadding),
        title: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
