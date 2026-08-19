import 'package:flutter/material.dart';
import 'package:studycycle/features/personalization/Profile/profile_header.dart';
import 'package:studycycle/features/personalization/Profile/profile_setting.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(),
            SizedBox(height: SSizes.md),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: SSizes.lg),
            ),
            ProfileSetting(),
          ]
        )
      )
    );
  }
}