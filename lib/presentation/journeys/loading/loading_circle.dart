import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/presentation/themes/theme_color.dart';

class LoadingCircle extends StatelessWidget {
  final double size;
  const LoadingCircle({
    Key key,
    @required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: FlareActor(
        'assets/animations/loading2.flr',
        animation: 'load',
        snapToEnd: true,
        // color: AppColor.royalBlue,

      ),
    );
  }
}
