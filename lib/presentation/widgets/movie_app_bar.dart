import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/common/screenutils/screenutils.dart';
import 'package:movies_app/common/extensions/size_extensions.dart';
import 'package:movies_app/presentation/blocs/search/search_bloc.dart';
import 'package:movies_app/presentation/journeys/search/custom_search_delegae.dart';
import 'package:movies_app/presentation/widgets/logo.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().statusBarHeight + Sizes.dimen_4.h,
        left: Sizes.dimen_4.w,
        right: Sizes.dimen_4.w,
      ),
      child: Container(
        child: Row(
          children: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/svgs/menu.svg',
                height: Sizes.dimen_12.h,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            Expanded(
              child: Logo(
                height: Sizes.dimen_6.h,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: Sizes.dimen_12.h,
              ),
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate(
                  BlocProvider.of<SearchBloc>(context),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
