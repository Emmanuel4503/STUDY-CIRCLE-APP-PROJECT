import 'package:flutter/material.dart';
import 'package:studycycle/features/cycle/library/widgets/featured_book_card.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/storage/dummy_data.dart';

class RecentlyAddedBooks extends StatelessWidget {
  const RecentlyAddedBooks({super.key});

  @override
  Widget build(BuildContext context) {
    const books = DummyData.books;

    return SizedBox(
      height: 270,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: SSizes.defaultSpace,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        separatorBuilder: (_, __) =>
            const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return FeaturedBookCard(
            book: books[index],
          );
        },
      ),
    );
  }
}