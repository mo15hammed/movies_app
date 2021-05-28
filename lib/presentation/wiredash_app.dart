import 'package:flutter/material.dart';
import 'package:movies_app/presentation/themes/theme_color.dart';
import 'package:wiredash/wiredash.dart';

class WiredashApp extends StatelessWidget {
  final navigationKey;
  final Widget child;
  final languageCode;

  const WiredashApp({
    Key key,
    @required this.navigationKey,
    @required this.child,
    this.languageCode = 'en',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'movies-xmgcl4r',
      secret: 'x2h7bfyi3fyty1ttaxq8fgyyrr4et6fd1ovgdilbq3n34iua',
      navigatorKey: navigationKey,
      child: child,
      options: WiredashOptionsData(
        textDirection: TextDirection.rtl,
        locale: Locale.fromSubtags(languageCode: languageCode),
      ),
      theme: WiredashThemeData(
          brightness: Brightness.dark,
          primaryColor: AppColor.royalBlue,
          secondaryColor: AppColor.violet,
          secondaryBackgroundColor: AppColor.vulcan,
          dividerColor: AppColor.vulcan),
    );
  }
}
