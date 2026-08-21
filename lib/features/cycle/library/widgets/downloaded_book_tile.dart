import 'package:flutter/material.dart';
import 'package:studycycle/features/cycle/library/models/book_model.dart';
import 'package:studycycle/features/cycle/library/widgets/preview_book.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/storage/dummy_data.dart';

class DownloadedBookTile extends StatelessWidget {
  const DownloadedBookTile({
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
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: SSizes.spaceBtwItems,
        ),
        child: Row(
          children: [
      
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                book.coverImage,
                width: 60,
                height: 75,
                fit: BoxFit.cover,
              ),
            ),
      
            const SizedBox(width: 14),
      
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
      
                  Text(
                    book.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium,
                  ),
      
                  const SizedBox(height: 4),
      
                  Text(
                    book.author,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall,
                  ),
      
                  const SizedBox(height: 6),
      
                  Row(
                    children: [
                      Icon(
                        Icons.download_done_rounded,
                        size: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'Available offline',
                      ),
                    ],
                  ),
                ],
              ),
            ),
      
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
      ),
    );
  }
}

class DownloadedBookList extends StatelessWidget {
  const DownloadedBookList({super.key});

  @override
  Widget build(BuildContext context) {
    const books = DummyData.books;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return DownloadedBookTile(
            book: books[index],
          );
        },
        childCount: books.length,
      ),
    );
  }
}