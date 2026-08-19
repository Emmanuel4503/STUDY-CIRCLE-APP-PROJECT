import 'package:flutter/material.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/features/cycle/Profile/widgets/profile_setting_item.dart';
import 'package:studycycle/features/cycle/Profile/widgets/invite_friend_widget.dart';
import 'package:studycycle/features/cycle/Profile/widgets/add_socials_widget.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileSettingItem(
            title: 'Full Name',
            subtitle: 'Change your full name',
            icon: Icons.person_outline,
            onTap: () {},
          ),
          const SizedBox(height: SSizes.md),
          ProfileSettingItem(
            title: 'Password',
            subtitle: 'Change your password',
            icon: Icons.lock_outline,
            onTap: () {},
          ),
          const SizedBox(height: SSizes.md),
          const InviteFriendWidget(),
          const SizedBox(height: SSizes.md),
          ProfileSettingItem(
            title: 'Check Active Groups',
            subtitle: 'View and manage your study groups',
            icon: Icons.groups_outlined,
            onTap: () {},
          ),
          const SizedBox(height: SSizes.md),
          const AddSocialsWidget(),
          const SizedBox(height: SSizes.md),
        ],
      ),
    );
  }
}

