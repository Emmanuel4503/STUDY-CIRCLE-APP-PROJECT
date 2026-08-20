import 'package:flutter/material.dart';
import 'package:studycycle/features/cycle/library/models/book_model.dart';
import 'package:studycycle/features/cycle/library/widgets/preview_book.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/storage/dummy_data.dart';

class FeaturedBookCard extends StatelessWidget {
  const FeaturedBookCard({
    super.key,
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookPreviewScreen(
              book: book,
            ),
          ),
        );
      },
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  book.coverImage,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
      
            const SizedBox(height: 8),
      
            Text(
              book.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium,
            ),
      
            Text(
              book.author,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class FeaturedBookList extends StatelessWidget {
  const FeaturedBookList({super.key});

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