extension NumExtension on num {
  String get percentage => (this * 10).toStringAsFixed(0) + ' %';
}