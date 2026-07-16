import 'package:flutter/material.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });

  final String image;
  final String title;
  final String subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: SSizes.spaceBtwSections * 3),

              // Visual Asset/Illustration Animation Area
              Image(
                width: screenWidth * 0.6,
                image: AssetImage(image),
              ),
              const SizedBox(height: SSizes.spaceBtwSections),

              // Success Title Status Header
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SSizes.spaceBtwItems),

              // Explanatory Subtitle Text
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SSizes.spaceBtwSections),

              // Main CTA Action Button (e.g. Continue to Login or Home)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
