/// String / value formatting helpers unrelated to dates.
abstract class Formatters {
  Formatters._();

  /// Capitalizes the first letter of [input].
  static String capitalize(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1);
  }

  /// Truncates [input] to [max] characters, appending an ellipsis.
  static String truncate(String input, int max) {
    if (input.length <= max) return input;
    return '${input.substring(0, max)}…';
  }

  /// Returns initials from a full name, e.g. "John Doe" -> "JD".
  static String initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) return '';
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return (parts.first[0] + parts.last[0]).toUpperCase();
  }
}
