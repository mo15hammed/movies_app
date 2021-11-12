import 'package:flutter/material.dart';

class SlideVerticalPageRouteBuilder extends PageRouteBuilder {
  final WidgetBuilder builder;
  final RouteSettings settings;
  SlideVerticalPageRouteBuilder({
    required this.builder,
    required this.settings,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curve = Curves.ease;
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            final tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
                position: animation.drive(tween), child: child);
          },
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 500),
          settings: settings,
        );
}
