import 'package:flutter/material.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class SetupOptionTile extends StatelessWidget {
  const SetupOptionTile({
    super.key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  });

  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(bottom: SSizes.spaceBtwItems),
        padding: const EdgeInsets.symmetric(
          horizontal: SSizes.md,
          vertical: SSizes.lg,
        ),
        decoration: BoxDecoration(
          color: isSelected ? SColors.primary.withAlpha(123) : SColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? SColors.primary : SColors.grey,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Icon(
              isSelected
                  ? Icons.check_circle
                  : Icons.arrow_forward_ios_rounded,
              color: isSelected ? SColors.primary : SColors.darkGrey,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}