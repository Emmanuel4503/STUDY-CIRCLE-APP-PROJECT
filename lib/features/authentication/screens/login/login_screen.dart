// lib/features/authentication/screens/login/login_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/features/authentication/screens/login/widgets/social_button.dart';
import 'package:studycycle/features/authentication/screens/verify_email/verify_email.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const SizedBox(height: SSizes.spaceBtwSections * 2),
              Text(
                'Welcome back, Scholar!',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: SSizes.spaceBtwItems),
              Text(
                'Continue your learning journey.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: SSizes.spaceBtwSections),

              // Form
              Form(
                child: Column(
                  children: [
                    // Email
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: SSizes.spaceBtwInputFields),

                    // Password
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check),
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Iconsax.eye),
                        ),
                      ),
                    ),

                    const SizedBox(height: SSizes.spaceBtwInputFields / 2),

                    // Remember Me & Forgot Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (value) {},
                            ),
                            const Text('Remember me'),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Forgot Password?'),
                        ),
                      ],
                    ),
                    const SizedBox(height: SSizes.spaceBtwSections),

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Sign In'),
                      ),
                    ),
                    const SizedBox(height: SSizes.spaceBtwItems),

                    // Create Account
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Get.to(const VerifyEmailScreen());
                        },
                        child: const Text('Create Account'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: SSizes.spaceBtwSections),

              // Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Flexible(child: Divider(thickness: 0.5)),
                  Text('  or sign in with  ',
                      style: Theme.of(context).textTheme.labelMedium),
                  const Flexible(child: Divider(thickness: 0.5)),
                ],
              ),
              const SizedBox(height: SSizes.spaceBtwItems),

              // Social Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: SColors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const SsocialButtons(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
