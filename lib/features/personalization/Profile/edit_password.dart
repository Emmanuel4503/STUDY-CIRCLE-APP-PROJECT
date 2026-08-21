import 'package:flutter/material.dart';
import 'package:studycycle/features/personalization/Profile/change_password.dart';
import 'package:studycycle/features/personalization/Profile/edit_profile_header.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class EditPassword extends StatelessWidget {
  const EditPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            EditProfileHeader(
              title: 'Security',
              subtitle: 'Keep your account protected with a strong password.',
              icon: Icons.lock_outline,
            ),
            SizedBox(height: SSizes.md),

            ChangePassword(),
          ]
        )
      )
    );
  }
}