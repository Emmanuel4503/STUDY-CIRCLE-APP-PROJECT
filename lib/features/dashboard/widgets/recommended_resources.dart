import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/features/dashboard/widgets/recommended_resource_card.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class RecommendedResources extends StatelessWidget {
  const RecommendedResources({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recommended Resources",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            GestureDetector(
              onTap: () {},
              child: const Row(
                children: [
                  Text(
                    "See All",
                    style: TextStyle(
                      color: SColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Iconsax.arrow_right_3,
                    size: SSizes.iconSm,
                    color: SColors.primary,
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        const RecommendedResourceCard(
          icon: Icons.menu_book,
          title: "Flutter Basics",
          type: "Beginner Course",
        ),

        const RecommendedResourceCard(
          icon: Icons.picture_as_pdf,
          title: "Accounting Notes",
          type: "PDF Notes",
        ),

        const RecommendedResourceCard(
          icon: Icons.quiz,
          title: "Mathematics Practice",
          type: "Practice Quiz",
        ),
      ],
    );
  }
}