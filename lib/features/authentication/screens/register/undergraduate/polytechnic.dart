import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/features/class_room/class_room.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class Polytechnic extends StatefulWidget {
  const Polytechnic({super.key});

  @override
  State<Polytechnic> createState() => _PolytechnicState();
}

class _PolytechnicState extends State<Polytechnic> {
 

  String? _selectedPolytechnic;
  String? _selectedCurrentPolytechnicLevel;

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