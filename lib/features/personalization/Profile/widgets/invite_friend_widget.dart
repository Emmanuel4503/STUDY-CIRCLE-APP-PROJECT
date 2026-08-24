import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/features/personalization/Profile/widgets/profile_setting_item.dart';
import 'package:studycycle/features/personalization/Profile/screens/invite_friend_screen.dart';

class InviteFriendWidget extends StatelessWidget {
  const InviteFriendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileSettingItem(
      title: 'Invite a Friend',
      subtitle: 'Share the app with your friends',
      icon: Icons.group_add_outlined,
      onTap: () {
        Get.to(() => const InviteFriendScreen());
      },
    );
  }
}

