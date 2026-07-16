import 'package:flutter/widgets.dart';

/// Consistent spacing scale (paddings, margins, gaps).
///
/// Prefer these over arbitrary numbers so vertical/horizontal rhythm stays
/// uniform. Ready-made [SizedBox] gaps are provided for convenience.
abstract class SSpacing {
  SSpacing._();

  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;

  /// Default screen edge padding.
  static const double screenPadding = 16.0;

  // Vertical gaps
  static const SizedBox gapVxs = SizedBox(height: xs);
  static const SizedBox gapVsm = SizedBox(height: sm);
  static const SizedBox gapVmd = SizedBox(height: md);
  static const SizedBox gapVlg = SizedBox(height: lg);
  static const SizedBox gapVxl = SizedBox(height: xl);

  // Horizontal gaps
  static const SizedBox gapHsm = SizedBox(width: sm);
  static const SizedBox gapHmd = SizedBox(width: md);
  static const SizedBox gapHlg = SizedBox(width: lg);
}
