import 'package:flutter/material.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/widgets/search_only.dart';

const List<String> universityOptions = [
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
  'National Open University of Nigeria (NOUN) Lagos State',
];

class University extends StatefulWidget {
  const University({super.key});

  @override
  State<University> createState() => _UniversityState();
}

class _UniversityState extends State<University> {
  String? _selectedUniversity;

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
              itemCount: universityOptions.length,
              separatorBuilder: (_, __) => const SizedBox(height: SSizes.spaceBtwItems),
              itemBuilder: (context, index) {
                final institution = universityOptions[index];
                final selected = institution == _selectedUniversity;

                return InkWell(
                  borderRadius: BorderRadius.circular(SSizes.borderRadiusMd),
                  onTap: () {
                    setState(() {
                      _selectedUniversity = institution;
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
