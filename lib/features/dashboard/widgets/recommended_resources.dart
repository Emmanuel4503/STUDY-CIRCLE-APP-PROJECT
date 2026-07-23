import 'package:flutter/material.dart';
import 'package:studycycle/features/dashboard/widgets/recommended_resource_card.dart';

class RecommendedResources extends StatelessWidget {
  const RecommendedResources({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recommended Resources",
          style: Theme.of(context).textTheme.headlineSmall,
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