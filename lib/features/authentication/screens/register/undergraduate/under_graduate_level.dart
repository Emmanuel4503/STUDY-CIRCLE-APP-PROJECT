import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/features/authentication/screens/register/undergraduate/college_of_edu.dart';
import 'package:studycycle/features/authentication/screens/register/undergraduate/polytechnic.dart';
import 'package:studycycle/features/authentication/screens/register/undergraduate/university.dart';
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
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {Get.to(const CollegeOfEdu());},
                      child: const Text('College of Education'),
                    ),
                  ),
                  const SizedBox(width: SSizes.defaultSpace),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {Get.to(const Polytechnic());},
                      child: const Text('Polytechnic'),
                    ),
                  ),
                  const SizedBox(width: SSizes.defaultSpace),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {Get.to(const University());},
                      child: const Text('University'),
                    ),
                  ),


                    
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}