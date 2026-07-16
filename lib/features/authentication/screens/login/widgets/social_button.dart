import 'package:flutter/material.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/images.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class SsocialButtons extends StatelessWidget {
  const SsocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: SColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: SSizes.iconMd,
              height: SSizes.iconMd,
              image: AssetImage(SImages.googleIcon),
            ), // Image
          ), // IconButton
        ), // Container
        const SizedBox(width: SSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: SColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: SSizes.iconMd,
              height: SSizes.iconMd,
              image: AssetImage(SImages.facebookIcon),
            ), // Image
          ), // IconButton
        ), // Container
      ],
    );
  }
}
