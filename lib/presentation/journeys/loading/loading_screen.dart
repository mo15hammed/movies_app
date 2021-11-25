import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/presentation/blocs/loading/loading_cubit.dart';
import 'package:movies_app/presentation/journeys/loading/loading_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/themes/app_theme.dart';

class LoadingScreen extends StatelessWidget {
  final Widget? screen;

  const LoadingScreen({Key? key, required this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingCubit, bool>(
      builder: (context, isLoading) {
        return Stack(
          fit: StackFit.expand,
          children: [
            screen ?? const SizedBox.shrink(),
            if (isLoading)
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background.withOpacity(0.8)),
                child: Center(
                  child: LoadingWidget(size: Sizes.dimen_230.w),
                ),
              ),
          ],
        );
      },
    );
  }
}