extension StringExtension on String {
  String intelliTrim({int chars = 15}) {
    return this.length > chars ? '${this.substring(0, chars)}...' : this;
  }
}
