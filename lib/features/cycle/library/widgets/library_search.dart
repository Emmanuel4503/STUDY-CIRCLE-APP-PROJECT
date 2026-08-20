import 'package:flutter/material.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/widgets/search_and_filter.dart';

class LibrarySearch extends StatelessWidget {
  const LibrarySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(SSizes.defaultSpace),
      child: SSearchAndFilter(
        text: 'Search in Library',
      ),
    );
  }
}