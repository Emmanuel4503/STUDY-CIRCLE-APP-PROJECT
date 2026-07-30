import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/features/authentication/screens/register/post_graduate.dart';
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
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {Get.to(const UnderGraduateLevel());},
                      child: const Text('UNDERGRADUATE'),
                    ),
                  ),
                  const SizedBox(width: SSizes.defaultSpace),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {Get.to(const PostgraduateScreen());},
                      child: const Text('POSTGRADUATE'),
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