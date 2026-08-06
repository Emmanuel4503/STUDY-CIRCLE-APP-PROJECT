import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        SSizes.defaultSpace,
        18,
        SSizes.defaultSpace,
        20,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            SColors.primary,
            SColors.primaryDark,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Top section
          Row(
            children: [

              Text(
                "Good Morning 👋",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                    ),
              ),

              const Spacer(),

              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: SColors.white.withValues(alpha: 0.8),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Iconsax.notification,
                  color: SColors.white,
                  size: 22,
                ),
              ),

              const SizedBox(width: 12),

              const CircleAvatar(
                radius: 22,
                backgroundColor: SColors.white,
                child: Icon(
                  Iconsax.profile_circle,
                  color: SColors.primary,
                  size: 26,
                ),
              ),
            ],
          ),

          const SizedBox(height: SSizes.sm),

          Text(
            "Emmanuel",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(
                  color: SColors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),

          const SizedBox(height: SSizes.xs),

          Text(
            "Learn together. Achieve more.",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(
                  color: SColors.white.withValues(alpha: 0.8),
                ),
          ),
        ],
      ),
    );
  }
}