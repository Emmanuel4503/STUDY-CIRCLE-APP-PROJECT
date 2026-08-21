import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/features/cycle/controllers/theme_controller.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class ThemeSettings extends StatelessWidget {
  const ThemeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Customise Theme'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        children: [
          Text(
            'Choose how StudyCycle looks on your device.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: SSizes.lg),
          Obx(
            () => Column(
              children: [
                _ThemeOption(
                  title: 'Light',
                  subtitle: 'Use the light theme',
                  icon: Icons.light_mode_outlined,
                  value: ThemeMode.light,
                  selectedMode: controller.themeMode.value,
                  onTap: () => controller.setThemeMode(ThemeMode.light),
                ),
                const SizedBox(height: SSizes.md),
                _ThemeOption(
                  title: 'Dark',
                  subtitle: 'Use the dark theme',
                  icon: Icons.dark_mode_outlined,
                  value: ThemeMode.dark,
                  selectedMode: controller.themeMode.value,
                  onTap: () => controller.setThemeMode(ThemeMode.dark),
                ),
                const SizedBox(height: SSizes.md),
                _ThemeOption(
                  title: 'System',
                  subtitle: 'Follow your device settings',
                  icon: Icons.settings_brightness_outlined,
                  value: ThemeMode.system,
                  selectedMode: controller.themeMode.value,
                  onTap: () => controller.setThemeMode(ThemeMode.system),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ThemeOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final ThemeMode value;
  final ThemeMode selectedMode;
  final VoidCallback onTap;

  const _ThemeOption({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.value,
    required this.selectedMode,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == selectedMode;
    final primary = Theme.of(context).colorScheme.primary;

    return Material(
      color: isSelected
          ? primary.withValues(alpha: 0.08)
          : Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(SSizes.borderRadiusMd),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(SSizes.borderRadiusMd),
        child: Container(
          padding: const EdgeInsets.all(SSizes.md),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SSizes.borderRadiusMd),
            border: Border.all(
              color: isSelected ? primary : Theme.of(context).dividerColor,
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Row(
            children: [
              Icon(icon, color: primary),
              const SizedBox(width: SSizes.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
              Icon(
                isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: isSelected ? primary : Theme.of(context).disabledColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}