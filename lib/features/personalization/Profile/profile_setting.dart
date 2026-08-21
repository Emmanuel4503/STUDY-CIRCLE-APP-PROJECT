import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/features/cycle/Profile/widgets/profile_setting_item.dart';
import 'package:studycycle/features/cycle/Profile/widgets/invite_friend_widget.dart';
import 'package:studycycle/features/cycle/Profile/widgets/add_socials_widget.dart';
import 'package:studycycle/features/dashboard/screens/groups_screen.dart';
import 'package:studycycle/features/personalization/Profile/edit_name.dart';
import 'package:studycycle/features/personalization/Profile/edit_password.dart';
import 'package:studycycle/app/routes/app_routes.dart';
import 'package:studycycle/utils/services/storage_service.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const _SectionLabel(title: 'Account Settings'),
          const SizedBox(height: SSizes.sm),
          ProfileSettingItem(
            title: 'Full Name',
            subtitle: 'Change your full name',
            icon: Icons.person,
            onTap: () => Get.to(() => const EditName()),
          ),
          const SizedBox(height: SSizes.md),
          ProfileSettingItem(
            title: 'Password',
            subtitle: 'Change your password',
            icon: Icons.lock,
            onTap: () => Get.to(() => const EditPassword()),
          ),
          const SizedBox(height: SSizes.md),
          const _SectionLabel(title: 'Community'),
          const SizedBox(height: SSizes.sm),
          const InviteFriendWidget(),
          const SizedBox(height: SSizes.md),
          ProfileSettingItem(
            title: 'Check Active Groups',
            icon: Icons.groups,
            onTap: () => Get.to(() => const GroupsScreen()),
          ),
          const SizedBox(height: SSizes.md),
          const _SectionLabel(title: 'Connect'),
          const SizedBox(height: SSizes.sm),
          const AddSocialsWidget(),
          const SizedBox(height: SSizes.md),
          const _SectionLabel(title: 'Session'),
          const SizedBox(height: SSizes.sm),
          ProfileSettingItem(
            title: 'Log Out',
            subtitle: 'Sign out of your StudyCycle account',
            icon: Icons.logout_rounded,
            accentColor: Theme.of(context).colorScheme.error,
            onTap: () => _confirmLogout(context),
          ),
          const SizedBox(height: SSizes.md),
        ],
      ),
    );
  }

  Future<void> _confirmLogout(BuildContext context) async {
    final shouldLogout = await Get.dialog<bool>(
      AlertDialog(
        title: const Text('Log out?'),
        content: const Text('You will need to sign in again to access your account.'),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Get.back(result: true),
            child: const Text('Log out'),
          ),
        ],
      ),
    );

    if (shouldLogout != true) return;

    await StorageService.instance.clear();
    if (context.mounted) {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}

class _SectionLabel extends StatelessWidget {
  final String title;

  const _SectionLabel({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.1,
          ),
    );
  }
}
