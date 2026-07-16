import 'package:flutter/material.dart';
import 'package:studycycle/utils/constants/colors.dart';


class PageIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const PageIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == currentIndex;
        return GestureDetector(
          onTap: onTap == null ? null : () => onTap!(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 8,
            width: isActive ? 24 : 8,
            decoration: BoxDecoration(
              color: isActive ? SColors.primary : SColors.grey,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        );
      }),
    );
  }
}
