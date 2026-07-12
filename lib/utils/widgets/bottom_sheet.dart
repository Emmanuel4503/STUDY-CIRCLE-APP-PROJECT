import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/radius.dart';
import '../constants/spacing.dart';

/// Helper for showing a consistent, themed modal bottom sheet.
///
/// Adds a drag handle, rounded top corners, and safe-area padding so every
/// sheet in the app looks the same.
abstract class AppBottomSheet {
  AppBottomSheet._();

  static Future<T?> show<T>({
    required Widget child,
    bool isScrollControlled = true,
  }) {
    return Get.bottomSheet<T>(
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(SSpacing.md),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag handle.
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: SSpacing.md),
                decoration: BoxDecoration(
                  color: Get.theme.dividerColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
      isScrollControlled: isScrollControlled,
      backgroundColor: Get.theme.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(SRadius.xl)),
      ),
    );
  }
}
