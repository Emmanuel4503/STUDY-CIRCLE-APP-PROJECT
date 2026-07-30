import 'package:flutter/material.dart';
import 'package:studycycle/features/cycle/library/widgets/book_display.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/storage/dummy_data.dart';
import 'package:studycycle/utils/widgets/app_double_text.dart';
import 'package:studycycle/utils/widgets/custom_appbar.dart';
import 'package:studycycle/utils/widgets/search_and_filter.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Library"),
      body: CustomScrollView(
        slivers: [
          // Search Bar
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(SSizes.defaultSpace),
              child: Column(
                children: [
                  SSearchAndFilter(
                    text: "Search in Library",
                  ),
                  SizedBox(height: SSizes.spaceBtwSections),
                ],
              ),
            ),
          ),

          // Section Header
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SSizes.defaultSpace,
              ),
              child: AppDoubleText(
                bigText: "Popular Books",
                smallText: "View All",
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: SSizes.spaceBtwItems),
          ),

          // Grid
          BookDisplay(
            count: DummyData.books.length - 4,
          ),
          const SliverToBoxAdapter(
              child: SizedBox(height: SSizes.spaceBtwSections)),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SSizes.defaultSpace,
              ),
              child: AppDoubleText(
                bigText: "Featured Books",
                smallText: "View All",
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: SSizes.spaceBtwItems),
          ),

          BookDisplay(count: DummyData.books.length),
        ],
      ),
    );
  }
}
