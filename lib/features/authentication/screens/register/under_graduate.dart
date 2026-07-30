import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/features/class_room/class_room.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class UnderGraduateScreen extends StatefulWidget {
  const UnderGraduateScreen({super.key});

  @override
  State<UnderGraduateScreen> createState() => _UnderGraduateScreenState();
}

class _UnderGraduateScreenState extends State<UnderGraduateScreen> {
  String? _selectedCollegeOfEducation;
  String? _selectedCurrentLevel;
  String? _selectedPolytechnic;
  String? _selectedCurrentPolytechnicLevel;
  String? _selectedUniversity;

  final List<String> _collegeOfEducation = [
    'Federal College of Education (Abeokuta, Ogun State)',
    'Federal College of Education (Kano, Kano State)',
    'Federal College of Education (Special) (Oyo, Oyo State)',
    'Federal College of Education (Technical) (Akoka, Lagos State)',
    'Alvan Ikoku Federal College of Education (Owerri, Imo State)',
    'Federal College of Education (Zaria, Kaduna State)',
  ];
  final List<String> _currentLevel = ['100lvl', '200lvl', '300lvl', '400lvl', '500lvl'];

  final List<String> _polytechnic  = [
    'Yaba College of Technology (YABATECH), Yaba, Lagos State',
    'Federal Polytechnic, Ilaro, Ogun State',
    'Auchi Polytechnic, Auchi, Edo State',
    'Federal Polytechnic, Nekede, Imo State',
    'Kaduna Polytechnic (KADPOLY), Kaduna State',
    'Federal Polytechnic, Bida, Niger State',
    'Federal Polytechnic, Ado-Ekiti, Ekiti State',
    'Federal Polytechnic, Offa, Kwara State',
    'Federal Polytechnic, Bauchi, Bauchi State',
    'Akanu Ibiam Federal Polytechnic, Unwana, Ebonyi State'
  ];
  final List<String> _currentPolytechnicLevel = ['ND1', 'ND2', 'HND1', 'HND2'];
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
              
              const SizedBox(height: SSizes.spaceBtwInputFields),
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
              
              const SizedBox(height: SSizes.spaceBtwInputFields),
             
              Row(//Polytechnic and Level
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: _selectedPolytechnic,
                      isExpanded: true,
                      decoration: const InputDecoration(
                        labelText: 'Polytechnic',
                        prefixIcon: Icon(Iconsax.teacher),
                      ),
                      hint: Text(
                        'Select Institution',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      items: _polytechnic.map((String level) {
                        return DropdownMenuItem<String>(
                          value: level,
                          child: Text(level),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedPolytechnic = value;
                        });
                      },
                    ),
                  ),

                  const SizedBox(width: SSizes.spaceBtwInputFields),

                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: _selectedCurrentPolytechnicLevel,
                      isExpanded: true,
                      decoration: const InputDecoration(
                        labelText: 'Level',
                        prefixIcon: Icon(Iconsax.teacher),
                      ),
                      hint: Text(
                        'Current Level',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      items: _currentPolytechnicLevel.map((String level) {
                        return DropdownMenuItem<String>(
                          value: level,
                          child: Text(level),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCurrentPolytechnicLevel = value;
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
