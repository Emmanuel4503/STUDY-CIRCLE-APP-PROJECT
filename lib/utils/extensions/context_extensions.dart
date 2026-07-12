import 'package:flutter/material.dart';

/// Convenience extensions on [BuildContext].
///
/// Turns verbose lookups into short, readable calls, e.g.
/// `context.textTheme.titleLarge` or `context.width`.
extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colors => Theme.of(this).colorScheme;

  Size get size => MediaQuery.of(this).size;
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}
