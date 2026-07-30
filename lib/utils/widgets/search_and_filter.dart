import 'package:flutter/material.dart';
import 'package:studycycle/utils/constants/spacing.dart';
import 'package:studycycle/utils/widgets/bottom_sheet.dart';
import 'package:studycycle/utils/widgets/filter_list.dart';

class SSearchAndFilter extends StatelessWidget {
  const SSearchAndFilter({
    super.key,
    required this.text
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: text,
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(width: SSpacing.md),
        IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () {
            AppBottomSheet.show(
              child: const FilterList(),
              isScrollControlled: true
            );
          },
        ),
      ],
    );
  }
}
