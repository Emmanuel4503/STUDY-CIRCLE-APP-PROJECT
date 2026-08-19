import 'package:flutter/material.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/spacing.dart';

class FilterList extends StatefulWidget {
  const FilterList({super.key});

  @override
  State<FilterList> createState() => _FilterListState(

  );
}

class _FilterListState extends State<FilterList> {
  String? selectedSchool;
  String? selectedDepartment;
  String? selectedLevel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SSpacing.screenPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Filter Groups",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          DropdownButtonFormField<String>(
            initialValue: selectedSchool,
            decoration: const InputDecoration(labelText: 'School'),
            items: const [
              DropdownMenuItem(
                value: 'UI',
                child: Text('University of Ibadan'),
              ),
              DropdownMenuItem(
                value: 'LASU',
                child: Text(' Lagos State University'),
              ),
              DropdownMenuItem(
                value: 'FUD',
                child: Text('Federal University Dutse'),
              ),
              DropdownMenuItem(
                value: 'UNILAG',
                child: Text('University of Lagos'),
              ),
              DropdownMenuItem(
                value: 'UNN',
                child: Text('University of Nigeria Nsukka'),
              ),
              DropdownMenuItem(
                value: 'OAU ',
                child: Text(' Obafemi Awolowo University'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedSchool = value;
              });
            },
          ),
          const SizedBox(
            height: SSpacing.sm,
          ),
          DropdownButtonFormField<String>(
            initialValue: selectedDepartment,
            decoration: const InputDecoration(labelText: 'Department'),
            items: const [
              DropdownMenuItem(
                value: 'CS',
                child: Text('Computer Science'),
              ),
              DropdownMenuItem(
                value: 'MATH',
                child: Text('Mathematics'),
              ),
              DropdownMenuItem(
                value: 'Chemistry',
                child: Text('Chemistry'),
              ),
              DropdownMenuItem(
                value: 'Law',
                child: Text('Law'),
              ),
              DropdownMenuItem(
                value: 'Bio Chemistry',
                child: Text('Bio Chemistry'),
              ),
              DropdownMenuItem(
                value: 'linguistics Spanish',
                child: Text('linguistics Spanish'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedDepartment = value;
              });
            },
          ),
          const SizedBox(
            height: SSpacing.sm,
          ),
          DropdownButtonFormField<String>(
            initialValue: selectedLevel,
            decoration: const InputDecoration(labelText: 'Level'),
            items: const [
              DropdownMenuItem(
                value: '100',
                child: Text('100 Level'),
              ),
              DropdownMenuItem(
                value: '200',
                child: Text('200 Level'),
              ),
              DropdownMenuItem(
                value: '300',
                child: Text('300 Level'),
              ),
              DropdownMenuItem(
                value: '400',
                child: Text('400 Level'),
              ),
               DropdownMenuItem(
                value: '500',
                child: Text('500 Level'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedLevel = value;
              });
            },
          ),
          const SizedBox(height: SSpacing.md),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(SColors.primary)),
            child: const Text("Apply", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
