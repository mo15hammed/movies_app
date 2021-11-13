import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/presentation/blocs/theme/theme_cubit.dart';
import 'package:movies_app/presentation/themes/app_theme.dart';
import 'package:wiredash/wiredash.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WiredashApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget child;

  const WiredashApp({
    Key? key,
    required this.navigatorKey,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = context.read<ThemeCubit>().state;
    return Wiredash(
      projectId: 'movies-xmgcl4r',
      secret: 'x2h7bfyi3fyty1ttaxq8fgyyrr4et6fd1ovgdilbq3n34iua',
      navigatorKey: navigatorKey,
      child: child,
      options: WiredashOptionsData(locale: context.locale),
      theme: WiredashThemeData(
        brightness:
            currentTheme == ThemeMode.dark ? Brightness.dark : Brightness.light,
        primaryColor: AppTheme.vulcan,
        secondaryColor: AppTheme.royalBlue,
        dividerColor:
            currentTheme == ThemeMode.dark ? AppTheme.vulcan : Colors.grey[200],
        secondaryBackgroundColor:
            currentTheme == ThemeMode.dark ? AppTheme.vulcan : Colors.grey[200],
      ),
    );
  }
}
