import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';


class DashboardSearchBar extends StatelessWidget {
  const DashboardSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search groups...',
          prefixIcon: Icon(
            Iconsax.search_normal,
            color: Theme.of(context).colorScheme.primary,
          ),

          suffixIcon: Icon(
            Iconsax.setting_4,
            color: Theme.of(context).colorScheme.primary,
          ),

        ),
      ),
    );
  }
}