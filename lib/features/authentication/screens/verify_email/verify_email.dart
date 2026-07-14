// lib/features/authentication/screens/verify_email/verify_email_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/features/authentication/screens/login/login_screen.dart';
import 'package:studycycle/utils/constants/images.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const LoginScreen());
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image(
                width: screenWidth * 0.6,
                image: const AssetImage(SImages.emailDeliveredIllustration),
              ),
              const SizedBox(height: SSizes.spaceBtwSections),

              // Title & Email
              Text(
                'Verify your email',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SSizes.spaceBtwItems),
              Text(
                email ?? 'support@studycircle.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SSizes.spaceBtwItems),
              Text(
                "We've sent you a verification link. Please check your inbox and click the link to activate your account.",
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SSizes.spaceBtwSections),

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("I've Verified My Email"),
                ),
              ),
              const SizedBox(height: SSizes.spaceBtwItems),

              // Resend Email
              TextButton(
                onPressed: () {},
                child: const Text('Resend Verification Email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
