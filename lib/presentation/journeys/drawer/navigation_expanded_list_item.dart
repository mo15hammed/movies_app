import 'package:flutter/material.dart';
import 'package:movies_app/presentation/journeys/drawer/navigation_list_item.dart';

class NavigationExpandedListItem extends StatelessWidget {
  const NavigationExpandedListItem({
    Key key,
    @required this.title,
    @required this.onPressed,
    @required this.children,
  }) : super(key: key);

  final String title;
  final Function onPressed;
  final List<String> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ExpansionTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        children: children
            .map(
              (e) => NavigationSubListItem(
                title: e,
                onPressed: () => onPressed(children.indexOf(e)),
              ),
            )
            .toList(),
      ),
    );
  }
}
