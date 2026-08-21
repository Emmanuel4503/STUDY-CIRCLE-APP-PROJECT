import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/features/class_room/class_room.dart';
import 'package:studycycle/features/dashboard/models/group_model.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/radius.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/constants/spacing.dart';
import 'package:studycycle/utils/widgets/custom_appbar.dart';

class GroupDetailsScreen extends StatelessWidget {
  const GroupDetailsScreen({
    super.key,
    required this.group,
  });

  final GroupModel group;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: group.title,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(SSizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Group Header
            Card(
              elevation: SSizes.cardElevation,
              color: Theme.of(context).colorScheme.surface,
              shape: RoundedRectangleBorder(
                borderRadius: SRadius.allLg,
              ),
              child: Padding(
                padding: const EdgeInsets.all(SSizes.lg),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 34,
                      backgroundColor: group.color.withValues(alpha: 0.15),
                      child: Icon(
                        group.icon,
                        color: group.color,
                        size: SSizes.iconLg,
                      ),
                    ),
                    SSpacing.gapVmd,
                    Text(
                      group.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: SSizes.fontXl,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    SSpacing.gapVxs,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Iconsax.profile_2user,
                          size: SSizes.iconSm,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        SSpacing.gapHsm,
                        Text(
                          group.members,
                          style: TextStyle(
                            fontSize: SSizes.fontSm,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    SSpacing.gapVsm,
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: SSizes.sm,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: SColors.success.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Iconsax.tick_circle,
                            size: SSizes.iconSm,
                            color: SColors.success,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Active',
                            style: TextStyle(
                              fontSize: SSizes.fontSm,
                              fontWeight: FontWeight.w200,
                              color: SColors.success,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: SSizes.lg),

            /// About
            Text(
              'About this group',
              style: TextStyle(
                fontSize: SSizes.fontLg,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),

            SSpacing.gapVsm,

            Text(
              'Study, collaborate and share knowledge with other '
              'students in ${group.title}.',
              style: TextStyle(
                fontSize: SSizes.fontSm,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),

            const SizedBox(height: SSizes.lg),

            /// Upcoming Session
            Text(
              'Classroom',
              style: TextStyle(
                fontSize: SSizes.fontLg,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),

            SSpacing.gapVsm,

            Card(
              elevation: SSizes.cardElevation,
              color: Theme.of(context).colorScheme.surface,
              shape: RoundedRectangleBorder(
                borderRadius: SRadius.allLg,
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: SSizes.md,
                  vertical: SSizes.xs,
                ),
                leading: CircleAvatar(
                  backgroundColor: SColors.primary.withValues(alpha: 0.12),
                  child: const Icon(
                    Iconsax.calendar_1,
                    color: SColors.primary,
                    size: SSizes.iconSm,
                  ),
                ),
                title: Text(
                  'My Classroom ',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                subtitle: Text(
                  style: TextStyle(
                    fontSize: SSizes.fontSm,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  'Today • 4:00 PM',
                ),
                trailing: IconButton(
                  onPressed: () {
                    Get.to(() => ClassroomScreen(group: group));
                  },
                  icon: const Icon(
                    Iconsax.arrow_right_3,
                    color: SColors.primary,
                    size: SSizes.iconSm,
                  ),
                ),
              ),
            ),

            const SizedBox(height: SSizes.lg),

            /// Group Members
            Text(
              'Group Members',
              style: TextStyle(
                fontSize: SSizes.fontLg,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),

            SSpacing.gapVsm,

            Card(
              elevation: SSizes.cardElevation,
              color: Theme.of(context).colorScheme.surface,
              shape: RoundedRectangleBorder(
                borderRadius: SRadius.allLg,
              ),
              child: Padding(
                padding: const EdgeInsets.all(SSizes.md),
                child: Row(
                  children: [
                    _MemberAvatar(
                      color: group.color,
                      icon: Iconsax.user,
                    ),
                    const _MemberAvatar(
                      color: SColors.info,
                      icon: Iconsax.user,
                    ),
                    const _MemberAvatar(
                      color: SColors.warning,
                      icon: Iconsax.user,
                    ),
                    const _MemberAvatar(
                      color: SColors.success,
                      icon: Iconsax.user,
                    ),
                    SSpacing.gapHsm,
                    Text(
                      '+20 more',
                      style: TextStyle(
                        fontSize: SSizes.fontSm,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: SSizes.lg),

            /// Recent Activity
            Text(
              'Recent Activitives',
              style: TextStyle(
                fontSize: SSizes.fontLg,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),

            SSpacing.gapVsm,

           const _ActivityItem(
              icon: Iconsax.document_upload,
              text: 'Sarah shared a study resource',
              color: SColors.primary,
            ),

            const _ActivityItem(
              icon: Iconsax.task_square,
              text: 'John completed a quiz',
              color: SColors.info,
            ),

            const _ActivityItem(
              icon: Iconsax.user_add,
              text: 'David joined the group',
              color: SColors.success,
            ),

            const SizedBox(height: SSizes.lg),
          ],
        ),
      ),
    );
  }
}

class _MemberAvatar extends StatelessWidget {
  const _MemberAvatar({
    required this.color,
    required this.icon,
  });

  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      margin: const EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withValues(alpha: 0.15),
      ),
      child: Icon(
        icon,
        size: SSizes.iconSm,
        color: color,
      ),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  const _ActivityItem({
    required this.icon,
    required this.text,
    required this.color,
  });

  final IconData icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: SSizes.sm),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha: 0.12),
            ),
            child: Icon(
              icon,
              size: SSizes.iconSm,
              color: color,
            ),
          ),
          SSpacing.gapHsm,
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: SSizes.fontSm,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
