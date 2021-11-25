import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/presentation/themes/app_theme.dart';

class LoadingWidget extends StatelessWidget {
  final double size;

  const LoadingWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: FlareActor(
          'assets/animations/loading_circle.flr',
          animation: 'load',
          snapToEnd: true,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}