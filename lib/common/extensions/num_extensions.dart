
extension NumExtension on num {

  String get perc => ((this ?? 0) * 10).toStringAsFixed(0) + ' %';

}
