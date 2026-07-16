/// Convenience extensions on [String].
extension StringExtensions on String {
  /// "hello world" -> "Hello world".
  String get capitalized =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';

  /// "hello world" -> "Hello World".
  String get titleCase => split(' ').map((w) => w.capitalized).join(' ');

  bool get isValidEmail =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
}
