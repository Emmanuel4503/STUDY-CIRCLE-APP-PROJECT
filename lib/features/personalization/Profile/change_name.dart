import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/features/personalization/Profile/profile.dart';
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
           TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon:  Icon(Icons.person),
                        labelText: 'full Name',
                      ),
                    ),
         const SizedBox(height: SSizes.md),
         
          TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon:  Icon(Icons.email),
                        labelText: 'Email',
                      ),
                    ),
          const SizedBox(height: SSizes.md),
          TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon:  Icon(Icons.phone),
                        labelText: 'Phone Number',
                      ),
                    ),
          const SizedBox(height: SSizes.md),
          TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon:  Icon(Icons.lock),
                        labelText: 'Password',
                      ),
                    ),
          const SizedBox(height: SSizes.md),
          ElevatedButton(
            onPressed: () {
              Get.to(const ProfileScreen());
            },
            child: const Text('Save Changes'),
          ),
        ],
      ),
    );
  }  
  }