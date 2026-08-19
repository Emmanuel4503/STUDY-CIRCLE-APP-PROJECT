import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/features/authentication/screens/register/undergraduate/college_of_edu/college_of_edu_tab.dart';
import 'package:studycycle/features/authentication/screens/register/undergraduate/polytechnic/polytechnic_tab.dart';
import 'package:studycycle/features/authentication/screens/register/undergraduate/university/university_tab.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class UnderGraduateLevel extends StatelessWidget {
  const UnderGraduateLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UNDERGRADUATE LEVEL'),
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
                  Get.to(const CollegeOfEduTab());
                },
                child: Container(
                  width: double.infinity,
                  height: 72,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(SSizes.borderRadiusMd),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'College of Education',
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
                  Get.to(const PolytechnicTab());
                },
                child: Container(
                  width: double.infinity,
                  height: 72,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(SSizes.borderRadiusMd),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Polytechnic',
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
                  Get.to(const UniversityTab());
                },
                child: Container(
                  width: double.infinity,
                  height: 72,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(SSizes.borderRadiusMd),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'University',
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