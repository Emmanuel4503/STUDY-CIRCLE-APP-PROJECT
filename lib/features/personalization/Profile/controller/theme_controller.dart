import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/utils/services/storage_service.dart';

class ThemeController extends GetxController {
  final themeMode = ThemeMode.system.obs;

  @override
  void onInit() {
    super.onInit();
    final savedMode = StorageService.instance.themeMode;
    if (savedMode == ThemeMode.light.name) {
      themeMode.value = ThemeMode.light;
    } else if (savedMode == ThemeMode.dark.name) {
      themeMode.value = ThemeMode.dark;
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    themeMode.value = mode;
    await StorageService.instance.setThemeMode(mode.name);
  }
}