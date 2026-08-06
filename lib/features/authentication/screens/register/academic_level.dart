import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/features/authentication/screens/register/postgraduate/post_graduate_level.dart';
import 'package:studycycle/features/authentication/screens/register/undergraduate/under_graduate_level.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class AcademicLevel extends StatelessWidget {
  const AcademicLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ACADEMIC LEVEL'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(SSizes.borderRadiusMd),
                onTap: () {
                  Get.to(const UnderGraduateLevel());
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: SSizes.lg,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(SSizes.borderRadiusMd),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'UNDERGRADUATE',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              const SizedBox(height: SSizes.defaultSpace),
              InkWell(
                borderRadius: BorderRadius.circular(SSizes.borderRadiusMd),
                onTap: () {
                  Get.to(const PostGraduateLevel());
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: SSizes.lg,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(SSizes.borderRadiusMd),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'POSTGRADUATE',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}