import 'package:flutter/material.dart';
import 'package:studycycle/features/cycle/library/models/book_model.dart';
import 'package:studycycle/features/cycle/library/widgets/preview_book.dart';
import 'package:studycycle/utils/storage/dummy_data.dart';

class LibraryBookCard extends StatelessWidget {
  const LibraryBookCard({
    super.key,
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
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

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Book cover
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

          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              book.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),

          const SizedBox(height: 3),

          // Author
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              book.author,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),

          const SizedBox(height: 4),

          // Rating
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                  size: 17,
                ),
                const SizedBox(width: 4),
                Text(
                  book.rating.toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PopularBookGrid extends StatelessWidget {
  const PopularBookGrid({super.key});

  @override
  Widget build(BuildContext context) {
    const books = DummyData.books;

    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return LibraryBookCard(
            book: books[index],
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