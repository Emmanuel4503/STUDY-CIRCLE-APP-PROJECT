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
      borderRadius: BorderRadius.circular(SSizes.md),
      onTap: onTap,
      hoverColor: SColors.primaryLight.withAlpha(3),
  splashColor: SColors.primary.withAlpha(8),
  highlightColor: Colors.transparent,
  focusColor: Colors.transparent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(bottom: SSizes.spaceBtwItems),
        padding: const EdgeInsets.symmetric(
          horizontal: SSizes.sm,
          vertical: SSizes.md,
        ),
        decoration: BoxDecoration(
          color: isSelected ? SColors.primary.withAlpha(2) : SColors.white,
          borderRadius: BorderRadius.circular(SSizes.md),
          border: Border.all(
            color: isSelected ? SColors.primary : SColors.grey,
            width: isSelected ? 1 : .5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected
                  ? Icons.check_circle
                  : Icons.school_outlined,
              color: isSelected
                  ? SColors.primary
                  : Colors.grey.shade600,
            ),
            const SizedBox(height: SSizes.sm),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}