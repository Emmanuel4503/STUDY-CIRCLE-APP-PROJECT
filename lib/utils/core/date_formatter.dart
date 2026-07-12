/// Lightweight date/time formatting helpers.
///
/// Kept dependency-free (no intl) so the boilerplate stays minimal. Swap in the
/// `intl` package here later if you need locale-aware formatting.
abstract class DateFormatter {
  DateFormatter._();

  static const List<String> _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  /// e.g. "12 Jul 2026".
  static String toReadable(DateTime date) {
    return '${date.day} ${_months[date.month - 1]} ${date.year}';
  }

  /// e.g. "14:05".
  static String toTime(DateTime date) {
    final h = date.hour.toString().padLeft(2, '0');
    final m = date.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  /// Relative label like "Today", "Yesterday" or a readable date.
  static String toRelative(DateTime date) {
    final now = DateTime.now();
    final diff = DateTime(now.year, now.month, now.day)
        .difference(DateTime(date.year, date.month, date.day))
        .inDays;
    if (diff == 0) return 'Today';
    if (diff == 1) return 'Yesterday';
    return toReadable(date);
  }
}
