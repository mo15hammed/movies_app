import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';
import 'package:wiredash/wiredash.dart';
import 'package:easy_localization/easy_localization.dart';

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
    return Wiredash(
      projectId: 'movies-xmgcl4r',
      secret: 'x2h7bfyi3fyty1ttaxq8fgyyrr4et6fd1ovgdilbq3n34iua',
      navigatorKey: navigatorKey,
      child: child,
      options: WiredashOptionsData(
        locale: context.locale
      ),
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.vulcan,
        secondaryColor: AppColors.royalBlue,
        dividerColor: AppColors.vulcan,
        secondaryBackgroundColor: AppColors.vulcan,
      ),
    );
  }
}
