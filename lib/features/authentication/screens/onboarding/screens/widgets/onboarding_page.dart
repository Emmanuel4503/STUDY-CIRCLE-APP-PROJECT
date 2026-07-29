import 'package:flutter/material.dart';
import 'package:studycycle/features/authentication/screens/onboarding/models/onboarding_model.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/constants/spacing.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel data;

  const OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SSpacing.lg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: SSizes.onboardingImageHeight,
            child: Image.asset(
              data.image,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.image_outlined,
                size: 120,
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
          SSpacing.gapVxl,
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: textTheme.headlineMedium,
          ),
          SSpacing.gapVmd,
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
