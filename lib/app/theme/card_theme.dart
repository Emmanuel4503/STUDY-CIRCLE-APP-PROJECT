import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/radius.dart';
import '../../utils/constants/sizes.dart';

/// Card styling for both themes.
abstract class SCardTheme {
  SCardTheme._();

  static final CardThemeData light = _build(SColors.lightCard);
  static final CardThemeData dark = _build(SColors.darkCard);

  static CardThemeData _build(Color color) {
    return CardThemeData(
      color: color,
      elevation: SSizes.cardElevation,
      margin: const EdgeInsets.all(0),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: SRadius.allLg),
    );
  }
}
