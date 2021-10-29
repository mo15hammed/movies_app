import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/presentation/widgets/logo.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: MediaQuery.of(context).padding.top + Sizes.dimen_4,
        start: Sizes.dimen_16,
        end: Sizes.dimen_16,
      ),
      // height: Sizes.dimen_50,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(
              'assets/svgs/menu.svg',
              height: Sizes.dimen_28,
            ),
          ),
          const Expanded(
            child: Logo(
              height: Sizes.dimen_48,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: Sizes.dimen_28,
            ),
          ),
        ],
      ),
    );
  }
}
