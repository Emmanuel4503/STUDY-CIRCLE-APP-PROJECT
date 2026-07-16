import 'package:flutter/widgets.dart';

/// Corner-radius scale used by buttons, cards, inputs, sheets, etc.
abstract class SRadius {
  SRadius._();

  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 24.0;
  static const double pill = 999.0;

  static final BorderRadius allSm = BorderRadius.circular(sm);
  static final BorderRadius allMd = BorderRadius.circular(md);
  static final BorderRadius allLg = BorderRadius.circular(lg);
  static final BorderRadius allXl = BorderRadius.circular(xl);
}
