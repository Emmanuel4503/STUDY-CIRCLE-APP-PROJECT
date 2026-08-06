import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/features/authentication/screens/register/postgraduate/masters/masters_tab.dart';
import 'package:studycycle/features/authentication/screens/register/postgraduate/phd/phd_tab.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class PostGraduateLevel extends StatelessWidget {
  const PostGraduateLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POSTGRADUATE LEVEL'),
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
                  Get.to(const MastersTab());
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
                    'Masters Level',
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
                  Get.to(const PhdTab());
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
                    'PHD Level',
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