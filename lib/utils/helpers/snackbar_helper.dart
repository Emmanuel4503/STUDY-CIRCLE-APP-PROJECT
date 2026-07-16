import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

/// Centralized snackbar/toast feedback using GetX overlays.
///
/// Call from anywhere (controllers included) without needing a BuildContext:
/// `SnackbarHelper.success('Saved!')`.
abstract class SnackbarHelper {
  SnackbarHelper._();

  static void _show(String title, String message, Color color) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      backgroundColor: color,
      colorText: SColors.white,
      duration: const Duration(seconds: 3),
    );
  }

  static void success(String message, {String title = 'Success'}) =>
      _show(title, message, SColors.success);

  static void error(String message, {String title = 'Error'}) =>
      _show(title, message, SColors.error);

  static void info(String message, {String title = 'Info'}) =>
      _show(title, message, SColors.info);

  static void warning(String message, {String title = 'Warning'}) =>
      _show(title, message, SColors.warning);
}
