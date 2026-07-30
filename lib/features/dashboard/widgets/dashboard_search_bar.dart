import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'package:studycycle/utils/constants/colors.dart';

class DashboardSearchBar extends StatelessWidget {
  const DashboardSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 60,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search groups...',
          hintStyle: TextStyle(
            color: SColors.darkGrey,
          ),

          prefixIcon: Icon(
            Iconsax.search_normal,
            color: SColors.primary,
          ),

          suffixIcon: Icon(
            Iconsax.setting_4,
            color: SColors.primary,
          ),

        ),
      ),
    );
  }
}