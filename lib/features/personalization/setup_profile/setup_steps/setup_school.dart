import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/features/personalization/setup_profile/controller/setup_profile_controller.dart';
import 'package:studycycle/utils/constants/sizes.dart';

const List<String> collegeOfEducationOptions = [
  'Federal College of Education (Abeokuta, Ogun State)',
  'Federal College of Education (Kano, Kano State)',
  'Federal College of Education (Special) (Oyo, Oyo State)',
  'Federal College of Education (Technical) (Akoka, Lagos State)',
  'Alvan Ikoku Federal College of Education (Owerri, Imo State)',
  'Federal College of Education (Zaria, Kaduna State)',
  'Federal College of Education (Kontagora, Niger State)',
  'Federal College of Education (Pankshin, Plateau State)',
  'Federal College of Education (Yola, Adamawa State)',
  'Federal College of Education (Gombe, Gombe State)',
  'Federal College of Education (Okene, Kogi State)',
  'Federal College of Education (Eha-Amufu, Enugu State)',
  'Federal College of Education (Obudu, Cross River State)',
  'Federal College of Education (Katsina, Katsina State)',
  'Federal College of Education (Iwo, Osun State)',
  'Tai Solarin College of Education (Ijebu-Ode, Ogun State)',
];

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
  'University of Abuja (UNIABUJA), Abuja',
  'University of Calabar (UNICAL), Calabar, Cross River State',
  'University of Jos (UNIJOS), Jos, Plateau State',
  'University of Uyo (UNIUYO), Uyo, Akwa Ibom State',
  'University of Maiduguri (UNIMAID), Maiduguri, Borno State',
  'Nnamdi Azikiwe University (UNIZIK), Awka, Anambra State',
  'Lagos State University (LASU), Ojo, Lagos State',
  'Rivers State University (RSU), Port Harcourt, Rivers State',
  'Delta State University (DELSU), Abraka, Delta State',
  'Ambrose Alli University (AAU), Ekpoma, Edo State',
  'Olabisi Onabanjo University (OOU), Ago-Iwoye, Ogun State',
  'Osun State University (UNIOSUN), Osogbo, Osun State',
  'Ekiti State University (EKSU), Ado-Ekiti, Ekiti State',
  'Kaduna State University (KASU), Kaduna, Kaduna State',
  'University of Africa, Toru-Orua, Bayelsa State',
  'Covenant University, Ota, Ogun State',
  'Babcock University, Ilishan-Remo, Ogun State',
  'Bowen University, Iwo, Osun State',
  'Redeemer\'s University, Ede, Osun State',
  'Afe Babalola University, Ado-Ekiti, Ekiti State',
  'Federal University Oye-Ekiti (FUOYE), Ekiti State',
  'Federal University Dutse (FUD), Jigawa State',
  'Federal University Lokoja (FUL), Kogi State',
  'Federal University Lafia (FULAFIA), Nasarawa State',
  'Federal University Birnin Kebbi (FUBK), Kebbi State',
  'Federal University Gusau (FUGUS), Zamfara State',
  'Federal University Kashere (FUKASHERE), Gombe State',
  'Federal University Wukari (FUWUKARI), Taraba State',
  'Federal University Dutsin-Ma (FUDMA), Katsina State',
  'Federal University of Health Sciences, Ila Orangun, Osun State',
];

const List<String> polytechnicOptions = [
  'Lagos Polytechnic, Lagos State',
  'Ondo Polytechnic, Ondo State',
  'Ibadan Polytechnic, Oyo State',
  'Zaria Polytechnic, Kaduna State',
  'Federal Polytechnic, Ede, Osun State',
  'Federal Polytechnic, Bida, Niger State',
  'Federal Polytechnic, Nekede, Imo State',
  'Federal Polytechnic, Bauchi, Bauchi State',
  'Federal Polytechnic, Ilaro, Ogun State',
  'Federal Polytechnic, Offa, Kwara State',
  'Yaba College of Technology, Yaba, Lagos State',
  'Auchi Polytechnic, Auchi, Edo State',
  'Kaduna Polytechnic, Kaduna State',
  'Federal Polytechnic, Nasarawa, Nasarawa State',
  'Federal Polytechnic, Idah, Kogi State',
  'Federal Polytechnic, Oko, Anambra State',
  'Federal Polytechnic, Ado-Ekiti, Ekiti State',
  'Federal Polytechnic, Mubi, Adamawa State',
  'Federal Polytechnic, Damaturu, Yobe State',
  'Rufus Giwa Polytechnic, Owo, Ondo State',
  'Kwara State Polytechnic, Ilorin, Kwara State',
  'Kogi State Polytechnic, Lokoja, Kogi State',
  'Benue State Polytechnic, Ugbokolo, Benue State',
  'Delta State Polytechnic, Ogwashi-Uku, Delta State',
  'Delta State Polytechnic, Ozoro, Delta State',
  'Edo State Polytechnic, Usen, Edo State',
  'The Polytechnic, Ibadan, Oyo State',
  'Osun State Polytechnic, Iree, Osun State',
  'Osun State College of Technology, Esa-Oke, Osun State',
  'Abraham Adesanya Polytechnic, Ijebu-Igbo, Ogun State',
  'Moshood Abiola Polytechnic, Abeokuta, Ogun State',
  'Gateway ICT Polytechnic, Saapade, Ogun State',
  'Ogun State Institute of Technology, Igbesa, Ogun State',
  'Federal Polytechnic, Ekowe, Bayelsa State',
  'Kenule Beeson Saro-Wiwa Polytechnic, Bori, Rivers State',
  'Akwa Ibom State Polytechnic, Ikot Osurua, Akwa Ibom State',
  'Cross River Institute of Technology and Management, Ugep, Cross River State',
  'Hassan Usman Katsina Polytechnic, Katsina State',
  'Umar Ali Shinkafi Polytechnic, Sokoto State',
  'Nuhu Bamalli Polytechnic, Zaria, Kaduna State',
];

class SetupSchool extends GetView<SetupProfileController> {
  const SetupSchool({super.key});

  List<String> getSchoolOptions() {
    final institutionName = controller.selectedInstitution.value?.name ?? 'University';

    switch (institutionName) {
      case 'Polytechnic':
        return polytechnicOptions;
      case 'College of Education':
        return collegeOfEducationOptions;
      case 'University':
      default:
        return universityOptions;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (!controller.requiresSchoolSelection) {
          return const SizedBox.shrink();
        }

        final schoolOptions = getSchoolOptions();
        final category = controller.selectedCategory.value?.category;
        final isSchoolNameEntry =
          category == 'Primary School' || category == 'Secondary School';
        final normalizedQuery = controller.schoolSearchQuery.value.trim().toLowerCase();
        final filteredSchools = normalizedQuery.isEmpty
          ? schoolOptions
          : schoolOptions
            .where((school) => school.toLowerCase().contains(normalizedQuery))
            .toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Almost there!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              isSchoolNameEntry
                  ? 'Enter the name of your school.'
                  : 'Search and choose your school.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: SSizes.spaceBtwSections),
            TextField(
              controller: isSchoolNameEntry ? controller.schoolController : null,
                onChanged: (value) => controller.schoolSearchQuery.value = value,
              decoration: const InputDecoration(
                labelText: 'School name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: SSizes.spaceBtwSections),
            if (isSchoolNameEntry)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.schoolController.text.trim().isEmpty
                      ? null
                      : controller.submitSchoolName,
                  child: const Text('Continue'),
                ),
              )
            else
              Expanded(
                child: ListView.separated(
                  itemCount: filteredSchools.length,
                  separatorBuilder: (_, __) => const SizedBox(height: SSizes.spaceBtwItems),
                  itemBuilder: (context, index) {
                    final school = filteredSchools[index];
                    final selected = controller.selectedSchool.value == school;

                    return InkWell(
                      borderRadius: BorderRadius.circular(SSizes.borderRadiusMd),
                      onTap: () {
                        controller.selectSchool(school);
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
                                : Theme.of(context).dividerColor,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                school,
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
        );
      },
    );
  }
}