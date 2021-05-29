import 'package:flutter/cupertino.dart';
import 'package:movies_app/presentation/app_localization.dart';

extension NumExtension on num {

  String get perc => ((this ?? 0) * 10).toStringAsFixed(0) + ' %';

}
