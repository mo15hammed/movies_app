import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/common/extensions/size_extensions.dart';

class NavigationListItem extends StatelessWidget {
  const NavigationListItem({
    Key key,
    @required this.title,
    @required this.onPressed,
  }) : super(key: key);
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}

class NavigationSubListItem extends StatelessWidget {
  const NavigationSubListItem({
    Key key,
    @required this.title,
    @required this.onPressed,
  }) : super(key: key);
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ListTile(
        contentPadding: EdgeInsetsDirectional.only(start: Sizes.dimen_12.w),
        title: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
