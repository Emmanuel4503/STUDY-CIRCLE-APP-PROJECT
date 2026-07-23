import 'package:flutter/material.dart';

import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/radius.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class DashboardCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const DashboardCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: SSizes.cardElevation,
      color: SColors.white,
      margin: margin ??
          const EdgeInsets.only(
            bottom: SSizes.spaceBtwItems,
          ),
      shape: RoundedRectangleBorder(
        borderRadius: SRadius.allMd,
      ),
      child: Padding(
        padding: padding ??
            const EdgeInsets.all(
              SSizes.md,
            ),
        child: child,
      ),
    );
  }
}