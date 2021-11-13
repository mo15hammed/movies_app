import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/presentation/blocs/theme/theme_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/themes/app_theme.dart';

class ToggleThemeButton extends StatelessWidget {
  const ToggleThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, theme) {
        return Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(Sizes.dimen_16),
          child: IconButton(
            icon: Icon(
              theme == ThemeMode.dark
                  ? Icons.brightness_4_sharp
                  : Icons.brightness_7_sharp,
              color: Theme.of(context).colorScheme.onBackground,
              size: Sizes.dimen_40.sp,
            ),
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
          ),
        );
      },
    );
  }
}
