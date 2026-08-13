import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/features/dashboard/models/group_model.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/radius.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/constants/spacing.dart';

class GroupCard extends StatelessWidget {
  const GroupCard({
    super.key,
    required this.group,
    this.isJoined = true,
    this.onTap,
  });

  final GroupModel group;
  final bool isJoined;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: SSizes.cardElevation,
      color: SColors.lightCard,
      shape: RoundedRectangleBorder(
        borderRadius: SRadius.allLg,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: SRadius.allLg,
        child: Padding(
          padding: const EdgeInsets.all(SSizes.md),
          child: Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: group.color.withValues(alpha: 0.15),
                child: Icon(
                  group.icon,
                  color: group.color,
                  size: SSizes.iconMd,
                ),
              ),

              SSpacing.gapHmd,

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      group.title,
                      style: const TextStyle(
                        fontSize: SSizes.fontMd,
                        fontWeight: FontWeight.w600,
                        color: SColors.lightTextPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SSpacing.gapVxs,

                    Row(
                      children: [
                        const Icon(
                          Iconsax.profile_2user,
                          size: SSizes.iconSm,
                          color: SColors.grey,
                        ),

                        SSpacing.gapHsm,

                        Text(
                          group.members,
                          style: const TextStyle(
                            fontSize: SSizes.fontSm,
                            color: SColors.lightTextSecondary,
                          ),
                        ),
                      ],
                    ),

                    SSpacing.gapVxs,

                    Row(
                      children: [
                        Icon(
                          isJoined
                              ? Iconsax.tick_circle
                              : Iconsax.add_circle,
                          size: SSizes.iconSm,
                          color: isJoined
                              ? SColors.success
                              : SColors.primary,
                        ),

                        SSpacing.gapHsm,

                        Text(
                          isJoined ? 'Active' : 'Join Group',
                          style: TextStyle(
                            fontSize: SSizes.fontSm,
                            fontWeight: FontWeight.w500,
                            color: isJoined
                                ? SColors.success
                                : SColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Icon(
                isJoined
                    ? Iconsax.arrow_right_3
                    : Iconsax.add,
                color: SColors.primary,
                size: SSizes.iconSm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}