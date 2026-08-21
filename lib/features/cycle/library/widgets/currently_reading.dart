import 'package:flutter/material.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/storage/dummy_data.dart';

class CurrentlyReadingScreen extends StatelessWidget {
  const CurrentlyReadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final book = DummyData.books[0];

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SSizes.defaultSpace,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -----------------------------
          // SECTION TITLE
          // -----------------------------

          Text(
            'Continue Reading',
            style: Theme.of(context).textTheme.headlineSmall,
          ),

          const SizedBox(
            height: SSizes.spaceBtwSections,
          ),

          // -----------------------------
          // BOOK
          // -----------------------------

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BOOK COVER
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  book.coverImage,
                  width: 110,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: SSizes.spaceBtwItems),

              // BOOK DETAILS
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),

                    const SizedBox(height: 6),

                    Text(
                      'by ${book.author}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),

                    const SizedBox(height: 16),

                    // PROGRESS BAR
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: book.progress,
                        minHeight: 8,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // PROGRESS DETAILS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${(book.progress * 100).round()}%',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          'Page ${book.currentPage}/${book.totalPages}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // CONTINUE BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 42,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Navigate to reading screen later
                        },
                        icon: const Icon(
                          Icons.menu_book_rounded,
                          size: 18,
                        ),
                        label: const Text(
                          'Continue Reading',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
