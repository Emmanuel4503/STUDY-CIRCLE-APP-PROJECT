import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/features/authentication/screens/login/login_screen.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class CollegeOfEduLevel extends StatefulWidget {
  const CollegeOfEduLevel({super.key});

  @override
  State<CollegeOfEduLevel> createState() => _CollegeOfEduLevelState();
}

class _CollegeOfEduLevelState extends State<CollegeOfEduLevel> {
  String? _selectedCurrentLevel;
  final List<String> _currentLevel = [
    '100lvl',
    '200lvl',
    '300lvl',
    '400lvl',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select your level',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: SSizes.md),
          Expanded(
            child: ListView.separated(
              itemCount: _currentLevel.length,
              separatorBuilder: (_, __) => const SizedBox(height: SSizes.spaceBtwItems),
              itemBuilder: (context, index) {
                final level = _currentLevel[index];
                final selected = level == _selectedCurrentLevel;

                return InkWell(
                  borderRadius: BorderRadius.circular(SSizes.borderRadiusMd),
                  onTap: () {
                    setState(() {
                      _selectedCurrentLevel = level;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(SSizes.md),
                    decoration: BoxDecoration(
                      color: selected
                          ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.08)
                          : Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(SSizes.borderRadiusMd),
                      border: Border.all(
                        color: selected
                            ? Theme.of(context).colorScheme.primary
                            : Colors.grey.shade300,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            level,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: selected
                                      ? Theme.of(context).colorScheme.primary
                                      : null,
                                ),
                          ),
                        ),
                        if (selected)
                          Icon(
                            Icons.check_circle,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Continue Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(const LoginScreen());
                        },
                        child: const Text('Continue'),
                      ),
                    ),
        ],
      ),
    );
  }
}