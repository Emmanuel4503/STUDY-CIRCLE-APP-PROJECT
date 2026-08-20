import 'package:flutter/material.dart';
import 'package:studycycle/features/cycle/library/widgets/library_book_card.dart';
import 'package:studycycle/utils/storage/dummy_data.dart';

class RecommendedBookGrid extends StatelessWidget {
  const RecommendedBookGrid({super.key});

  @override
  Widget build(BuildContext context) {
    const books = DummyData.books;

    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return LibraryBookCard(
            book: books[index] as dynamic,
          );
        },
        childCount: books.length,
      ),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 24,
        childAspectRatio: .68,
      ),
    );
  }
}