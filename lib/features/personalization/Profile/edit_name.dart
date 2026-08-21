import 'package:flutter/material.dart';
import 'package:studycycle/features/personalization/Profile/change_name.dart';
import 'package:studycycle/features/personalization/Profile/edit_profile_header.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class EditName extends StatelessWidget {
  const EditName({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            EditProfileHeader(
              title: 'Edit Profile',
              subtitle: 'Update your personal information below.',
              icon: Icons.person_outline,
            ),
            SizedBox(height: SSizes.md),

            ChangeName(),
          ]
        )
      )
    );
  }
}