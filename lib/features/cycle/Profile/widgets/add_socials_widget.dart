import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/features/cycle/Profile/widgets/profile_setting_item.dart';
import 'package:studycycle/features/cycle/Profile/screens/add_socials_screen.dart';

class AddSocialsWidget extends StatelessWidget {
  const AddSocialsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileSettingItem(
      title: 'Add Socials',
      subtitle: 'Connect your social media accounts',
      icon: Icons.link,
      onTap: () {
        Get.to(() => const AddSocialsScreen());
      },
    );
  }
}

