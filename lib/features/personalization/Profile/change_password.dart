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
           TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon:  Icon(Icons.key),
                        labelText: 'Old Password',
                        suffixIcon: Icon(Icons.visibility),
                      ),
                    ),
         const SizedBox(height: SSizes.md),
         
          TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon:  Icon(Icons.lock),
                        labelText: 'New Password',
                        suffixIcon: Icon(Icons.visibility),
                      ),
                    ),
         
          const SizedBox(height: SSizes.md),
          TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon:  Icon(Icons.check_circle_outline),
                        labelText: 'Confirm New Password',
                        suffixIcon: Icon(Icons.visibility),
                      ),
                    ),
          const SizedBox(height: SSizes.md),
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Update Password'),
          ),
        ],
      ),
    );
  }  
  }