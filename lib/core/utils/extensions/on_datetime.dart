extension DateTimeX on DateTime {
  String toStringDateOnly() {
    return '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  }
}
