import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart'; // Added missing icon package
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/radius.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/helpers/helper_functions.dart';

class ClassroomTaskCard extends StatelessWidget {
  const ClassroomTaskCard({
    super.key,
    required this.title,
    required this.course,
    required this.deadline,
    required this.statusText,
    required this.statusColor,
    required this.icon,
  });

  final IconData icon;
  final Color statusColor;
  final String deadline;
  final String course;
  final String title;
  final String statusText;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.all(SSizes.md),
      decoration: BoxDecoration(
        border: Border.all(color: SColors.grey),
        borderRadius: BorderRadius.circular(SRadius.md),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          padding: const EdgeInsets.all(SSizes.sm),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Theme.of(context).primaryColor),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(course, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 4),
            Text(
              deadline,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: SColors.darkGrey),
            ),
          ],
        ),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Status Indicator Label
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(SRadius.sm),
              ),
              child: Text(
                statusText,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: dark ? SColors.grey : SColors.darkGrey,
                    ),
              ),
            ),
            const SizedBox(width: SSizes.spaceBtwSections),

            if (statusText == 'Pending')
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Iconsax.arrow_right_3, size: 16),
                label: const Text(
                  "Start",
                  style: TextStyle(fontSize: SSizes.fontSm * 0.7),
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: SSizes.md,
                    vertical: SSizes.xs,
                  ),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              )
            else
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Iconsax.tick_circle,
                    size: SSizes.iconSm,
                    color: Colors.green,
                  ),
                  const SizedBox(width: SSizes.xs),
                  Text(
                    'Completed',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
