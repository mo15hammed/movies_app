import 'package:flutter/cupertino.dart';
import 'package:movies_app/presentation/app_localization.dart';

extension StringExtension on String {
  String intelliTrim({int chars = 15}) {
    return this.length > chars ? '${this.substring(0, chars)}...' : this;
  }

  String t(BuildContext context) {
    return AppLocalization.of(context).translate(this);
  }
}
