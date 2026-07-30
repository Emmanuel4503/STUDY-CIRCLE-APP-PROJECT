import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/features/class_room/class_room.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class CollegeOfEdu extends StatefulWidget {
  const CollegeOfEdu({super.key});

  @override
  State<CollegeOfEdu> createState() => _CollegeOfEduState();
}

class _CollegeOfEduState extends State<CollegeOfEdu> {
  String? _selectedCollegeOfEducation;
  String? _selectedCurrentLevel;

final List<String> _collegeOfEducation = [
    'Federal College of Education (Abeokuta, Ogun State)',
    'Federal College of Education (Kano, Kano State)',
    'Federal College of Education (Special) (Oyo, Oyo State)',
    'Federal College of Education (Technical) (Akoka, Lagos State)',
    'Alvan Ikoku Federal College of Education (Owerri, Imo State)',
    'Federal College of Education (Zaria, Kaduna State)',
  ];
  final List<String> _currentLevel = ['100lvl', '200lvl', '300lvl', '400lvl'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('COLLEGE OF EDUCATION '),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              Row(//College of Education and Level
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: _selectedCollegeOfEducation,
                      isExpanded: true,
                      decoration: const InputDecoration(
                        labelText: 'College of Education',
                        prefixIcon: Icon(Iconsax.teacher),
                      ),
                      hint: Text(
                        'Select Institution',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      items: _collegeOfEducation.map((String level) {
                        return DropdownMenuItem<String>(
                          value: level,
                          child: Text(level),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCollegeOfEducation = value;
                        });
                      },
                    ),
                  ),

                  const SizedBox(width: SSizes.spaceBtwInputFields),

                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: _selectedCurrentLevel,
                      isExpanded: true,
                      decoration: const InputDecoration(
                        labelText: 'Level',
                        prefixIcon: Icon(Iconsax.teacher),
                      ),
                      hint: Text(
                        'Current level',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      items: _currentLevel.map((String level) {
                        return DropdownMenuItem<String>(
                          value: level,
                          child: Text(level),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCurrentLevel = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: SSizes.spaceBtwSections),

                    // Continue Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {Get.to(const ClassroomScreen());},
                        child: const Text('Continue'),
                      ),
                    ),
            ],
            )
            )
            ),
    );

  }
}