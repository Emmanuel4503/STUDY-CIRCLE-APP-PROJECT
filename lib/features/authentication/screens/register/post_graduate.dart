import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/features/class_room/class_room.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class PostgraduateScreen extends StatefulWidget {
  const PostgraduateScreen({super.key});

  @override
  State<PostgraduateScreen> createState() => _PostgraduateScreenState();
}
class _PostgraduateScreenState extends State<PostgraduateScreen> {
  String? _selectedPostgraduateLevel;
  String? _selectedCurrentPGLevel;

  final List<String> _postgraduateLevel = ['Masters', 'PhD'];
  final List<String> _currentPGLevel = ['500lvl', '600lvl', '700lvl'];


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POSTGRADUATE CLASS'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [Row(//Postgraduate and Level
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: _selectedPostgraduateLevel,
                      isExpanded: true,
                      decoration: const InputDecoration(
                        labelText: 'Postgraduate',
                        prefixIcon: Icon(Iconsax.teacher),
                      ),
                      hint: Text(
                        'Select your postgraduate level',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      items: _postgraduateLevel.map((String level) {
                        return DropdownMenuItem<String>(
                          value: level,
                          child: Text(level),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedPostgraduateLevel = value;
                        });
                      },
                    ),
                  ),

                  const SizedBox(width: SSizes.spaceBtwInputFields),

                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: _selectedCurrentPGLevel,
                      isExpanded: true,
                      decoration: const InputDecoration(
                        labelText: 'Level',
                        prefixIcon: Icon(Iconsax.teacher),
                      ),
                      hint: Text(
                        'Select your postgraduate level',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      items: _currentPGLevel.map((String level) {
                        return DropdownMenuItem<String>(
                          value: level,
                          child: Text(level),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCurrentPGLevel = value;
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