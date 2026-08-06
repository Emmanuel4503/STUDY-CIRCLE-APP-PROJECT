import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/features/authentication/screens/login/widgets/social_button.dart';
import 'package:studycycle/features/authentication/screens/register/academic_level.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Header
              Text(
                'Create your Account',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: SSizes.spaceBtwSections),

              // Sign Up Form UI
              Form(
                child: Column(
                  children: [
                    // First & Last Name row layout
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'First Name',
                              prefixIcon: Icon(Iconsax.user),
                            ),
                          ),
                        ),
                        const SizedBox(width: SSizes.spaceBtwInputFields),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Last Name',
                              prefixIcon: Icon(Iconsax.user),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: SSizes.spaceBtwInputFields),

                    // Email Field
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Iconsax.direct),
                      ),
                    ),
                    const SizedBox(height: SSizes.spaceBtwInputFields),

                    // Password Input Field
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Iconsax.eye),
                        ),
                      ),
                    ),
                    const SizedBox(height: SSizes.spaceBtwSections),

                    // Terms & Conditions Row
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                        ),
                        const SizedBox(width: SSizes.spaceBtwItems),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'I agree to ',
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Theme.of(context).primaryColor,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                                TextSpan(
                                    text: ' and ',
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                                TextSpan(
                                  text: 'Terms of Use',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Theme.of(context).primaryColor,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: SSizes.spaceBtwSections),

                    // Submit Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(const AcademicLevel());
                        },
                        child: const Text('Register'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: SSizes.spaceBtwSections),

              // Social Sign-In Section Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Flexible(child: Divider(thickness: 0.5)),
                  Text('  or sign up with  ',
                      style: Theme.of(context).textTheme.labelMedium),
                  const Flexible(child: Divider(thickness: 0.5)),
                ],
              ),
              const SizedBox(height: SSizes.spaceBtwItems),

              // Google & Facebook Social Signup Shortcut Button
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
