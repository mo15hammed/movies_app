import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/widgets/logo.dart';

import 'navigation_expanded_list_item.dart';
import 'navigation_list_item.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
            offset: const Offset(-2.0, 0.0),
          ),
        ],
      ),
      width: Sizes.dimen_300.w,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: Sizes.dimen_20.h,
                bottom: Sizes.dimen_56.h,
                start: Sizes.dimen_28.w,
                end: Sizes.dimen_28.w,
              ),
              child: const Logo(),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).primaryColor.withOpacity(0.8),
                    blurRadius: 2.0,
                    offset: const Offset(-2.0, 0.0),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NavigationListItem(
                    title: 'Favorite Movies',
                    onPressed: () {},
                  ),
                  NavigationExpandedListItem(
                    title: 'Language',
                    onPressed: () {},
                    children: const ['English', 'Arabic'],
                  ),
                  NavigationListItem(
                    title: 'Feedback',
                    onPressed: () {},
                  ),
                  NavigationListItem(
                    title: 'About',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
