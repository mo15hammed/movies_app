import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/presentation/blocs/loading/loading_bloc.dart';
import 'package:movies_app/presentation/journeys/loading/loading_circle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/themes/theme_color.dart';

class LoadingScreen extends StatelessWidget {
  final Widget screen;
  const LoadingScreen({
    Key key,
    @required this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingBloc, LoadingState>(builder: (_, state) {
      return Stack(
        children: [
          screen ?? Container(),
          if (state is LoadingStarted)
            Container(
              color: AppColor.vulcan.withOpacity(0.8),
              child: Center(
                child: LoadingCircle(
                  size: Sizes.dimen_400.w,
                ),
              ),
            ),
        ],
      );
    });
  }
}
