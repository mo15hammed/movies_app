import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/presentation/blocs/language/language_bloc.dart';
import 'package:movies_app/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationExpandedListItem extends StatelessWidget {
  final String title;
  final Function(int) onPressed;
  final List<String> children;
  final double contentPadding;

  const NavigationExpandedListItem({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.children,
    this.contentPadding = Sizes.dimen_32,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      children: children.map((child) {
        int index = children.indexOf(child);
        return NavigationListItem(
          contentPadding: contentPadding,
          title: child,
          onPressed: () {
            onPressed(index);
          },
        );
      }).toList(),
    );
  }
}
