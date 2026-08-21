import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal details',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: SSizes.sm),
          Text(
            'Make sure your information is up to date.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: SSizes.md),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(SSizes.md),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outline),
                      labelText: 'Full Name',
                    ),
                  ),
                  const SizedBox(height: SSizes.md),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: SSizes.md),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone_outlined),
                      labelText: 'Phone Number',
                    ),
                  ),
                  const SizedBox(height: SSizes.md),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      labelText: 'Password',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: SSizes.md),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: Get.back,
              icon: const Icon(Icons.check_rounded),
              label: const Text('Save Changes'),
            ),
          ),
        ],
      ),
    );
  }  
  }