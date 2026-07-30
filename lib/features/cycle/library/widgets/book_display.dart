import 'package:flutter/material.dart';
import 'package:studycycle/features/cycle/library/widgets/book_card.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/storage/dummy_data.dart';

class BookDisplay extends StatelessWidget {
  const BookDisplay({
    super.key,
    required this.count
  });

final int count;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: SSizes.defaultSpace,
      ),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return BookCard(
              book: DummyData.books[index],
            );
          },
          childCount: count,
        ),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 20,
          childAspectRatio: .58,
        ),
      ),
    );
  }
}