import 'package:flutter/cupertino.dart';

class FadePageRouteBuilder extends PageRouteBuilder {
  final WidgetBuilder builder;
  final RouteSettings settings;

  FadePageRouteBuilder({
    @required this.builder,
    @required this.settings,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curve = Curves.ease;
            const begin = 0.0;
            const end = 1.0;
            final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return FadeTransition(opacity: animation.drive(tween), child: child);
          },
          transitionDuration: const Duration(milliseconds: 500),
          settings: settings,
        );
}
