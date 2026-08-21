import 'package:flutter/material.dart';
import 'package:studycycle/features/personalization/Profile/profile_header.dart';
import 'package:studycycle/features/personalization/Profile/profile_setting.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? SColors.lighterBackground
          : Theme.of(context).scaffoldBackgroundColor,
      body: const SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileHeader(),
              SizedBox(height: SSizes.md),
              ProfileSetting(),
            ],
          ),
        ),
      ),
    );
  }
}