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
            EditProfileHeader(),
            SizedBox(height: SSizes.md),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: SSizes.lg),
            ),
           ChangeName(),
          ]
        )
      )
    );
  }
}