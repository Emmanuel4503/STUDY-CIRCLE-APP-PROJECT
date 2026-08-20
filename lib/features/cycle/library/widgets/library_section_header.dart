import 'package:flutter/material.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class LibrarySectionHeader extends StatelessWidget {
  const LibrarySectionHeader({
    super.key,
    required this.title,
    this.onViewAll,
  });

  final String title;
  final VoidCallback? onViewAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: SSizes.spaceBtwSections,
        left: SSizes.defaultSpace,
        right: SSizes.defaultSpace,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),

          TextButton(
            onPressed: onViewAll,
            child: const Text('View all'),
          ),
        ],
      ),
    );
  }
}