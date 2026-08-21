import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/features/dashboard/models/group_model.dart';
import 'package:studycycle/utils/constants/radius.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/constants/spacing.dart';

class ActiveGroupCard extends StatelessWidget {
  const ActiveGroupCard({
    super.key,
    required this.group,
    this.onTap,
  });

  final GroupModel group;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: SRadius.allLg,
          side: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 1,
          ),
        ),
      child: InkWell(
        onTap: onTap,
        borderRadius: SRadius.allLg,
        child: Padding(
          padding: const EdgeInsets.all(SSizes.md),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
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
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: SSizes.fontMd,
                            fontWeight: FontWeight.w600,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SSpacing.gapVxs,

                    Row(
                      children: [
                        Icon(
                          Iconsax.profile_2user,
                          size: SSizes.iconSm,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),

                        SSpacing.gapHsm,

                        Text(
                          group.members,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontSize: SSizes.fontSm,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Icon(
                Iconsax.arrow_right_3,
                color: Theme.of(context).colorScheme.primary,
                size: SSizes.iconSm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}