import 'package:flutter/material.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/widgets/search_only.dart';

const List<String> collegeOfEducationOptions = [
  'Federal College of Education (Abeokuta, Ogun State)',
  'Federal College of Education (Kano, Kano State)',
  'Federal College of Education (Special) (Oyo, Oyo State)',
  'Federal College of Education (Technical) (Akoka, Lagos State)',
  'Alvan Ikoku Federal College of Education (Owerri, Imo State)',
  'Federal College of Education (Zaria, Kaduna State)',
];

class CollegeOfEdu extends StatefulWidget {
  const CollegeOfEdu({super.key});

  @override
  State<CollegeOfEdu> createState() => _CollegeOfEduState();
}

class _CollegeOfEduState extends State<CollegeOfEdu> {
  String? _selectedCollegeOfEducation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SSizes.defaultSpace),
      child: Column(
        children: [
          const SSearchOnly(
            text: 'Search Institutions',
          ),
          const SizedBox(height: SSizes.spaceBtwSections),
          Expanded(
            child: ListView.separated(
              itemCount: collegeOfEducationOptions.length,
              separatorBuilder: (_, __) => const SizedBox(height: SSizes.spaceBtwItems),
              itemBuilder: (context, index) {
                final institution = collegeOfEducationOptions[index];
                final selected = institution == _selectedCollegeOfEducation;

                return InkWell(
                  borderRadius: BorderRadius.circular(SSizes.borderRadiusMd),
                  onTap: () {
                    setState(() {
                      _selectedCollegeOfEducation = institution;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(SSizes.md),
                    decoration: BoxDecoration(
                      color: selected
                          ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.08)
                          : Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(SSizes.borderRadiusMd),
                      border: Border.all(
                        color: selected
                            ? Theme.of(context).colorScheme.primary
                            : Colors.grey.shade300,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            institution,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: selected
                                      ? Theme.of(context).colorScheme.primary
                                      : null,
                                ),
                          ),
                        ),
                        if (selected)
                          Icon(
                            Icons.check_circle,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
