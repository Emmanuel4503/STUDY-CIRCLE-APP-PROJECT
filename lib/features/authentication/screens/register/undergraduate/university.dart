import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/features/class_room/class_room.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class University extends StatefulWidget {
  const University({super.key});

   @override
  State<University> createState() => _UniversityState();
}

class _UniversityState extends State<University> {
  String? _selectedUniversity;
  String? _selectedCurrentLevel;

    final List<String> _currentLevel = ['100lvl', '200lvl', '300lvl', '400lvl', '500lvl'];
final List<String> _universities = [
    'University of Lagos (UNILAG), Akoka, Lagos State',
    'Obafemi Awolowo University (OAU), Ile-Ife, Osun State',
    'University of Ibadan (UI), Ibadan, Oyo State',
    'Ahmadu Bello University (ABU), Zaria, Kaduna State',
    'University of Nigeria (UNN), Nsukka, Enugu State',
    'University of Benin (UNIBEN) Benin City', 
    'University of Ilorin (UNILORIN) Ilorin, Kwara State',
    'Bayero University Kano (BUK) Kano, Kano State',
    'University of Port Harcourt (UNIPORT) Port Harcourt, Rivers State',
    'Federal University of Agriculture, Abeokuta (FUNAAB) Abeokuta, Ogun State',
    'National Open University of Nigeria (NOUN) Lagos State'
  ];



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
        title: const Text('UNDERGRADUATE CLASSES'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
                Row(//University and Level
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: _selectedUniversity,
                      isExpanded: true,
                      decoration: const InputDecoration(
                        labelText: 'University',
                        prefixIcon: Icon(Iconsax.teacher),
                      ),
                      hint: Text(
                        'Select Institution',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      items: _universities.map((String level) {
                        return DropdownMenuItem<String>(
                          value: level,
                          child: Text(level),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedUniversity = value;
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
          ),
        ),
      ),
    );
              
  }
}