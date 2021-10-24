extension StringExtension on String {
  String get ellipsis => length > 15 ? '${substring(0, 15)}...' : this;
}
