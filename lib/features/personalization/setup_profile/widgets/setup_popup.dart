import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class SSetupPopup extends StatelessWidget {
  const SSetupPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Close Button
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Iconsax.close_circle),
              ),
            ),
            const SizedBox(height: SSizes.spaceBtwSections),
            const Text(
              "Complete Your Profile",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

           const SizedBox(height: SSizes.spaceBtwItems),

            const Text(
              "Completing your profile helps us personalize your experience.",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: SSizes.spaceBtwSections),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/setup-profile');
                },
                child: const Text("Complete Profile"),
              ),
            ),

            TextButton(
              onPressed: () => Get.back(),
              child: const Text("Skip for now"),
            ),
          ],
        ),
      ),
    );
  }
}