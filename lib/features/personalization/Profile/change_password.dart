import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Change password',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: SSizes.sm),
          Text(
            'Use a password you do not reuse elsewhere.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: SSizes.md),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(SSizes.md),
              child: Column(
                children: [
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.key_outlined),
                      labelText: 'Old Password',
                    ),
                  ),
                  const SizedBox(height: SSizes.md),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      labelText: 'New Password',
                    ),
                  ),
                  const SizedBox(height: SSizes.md),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.check_circle_outline),
                      labelText: 'Confirm New Password',
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
              icon: const Icon(Icons.shield_outlined),
              label: const Text('Update Password'),
            ),
          ),
        ],
      ),
    );
  }  
  }