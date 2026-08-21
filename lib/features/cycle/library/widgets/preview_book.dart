import 'package:flutter/material.dart';
import 'package:studycycle/features/cycle/library/models/book_model.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class BookPreviewScreen extends StatelessWidget {
  const BookPreviewScreen({
    super.key,
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Preview'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // -----------------------------
            // BOOK COVER
            // -----------------------------

            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  book.coverImage,
                  width: 200,
                  height: 290,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(
              height: SSizes.spaceBtwSections,
            ),

            // -----------------------------
            // TITLE
            // -----------------------------

            Text(
              book.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 8),

            // -----------------------------
            // AUTHOR
            // -----------------------------

            Text(
              'by ${book.author}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(
              height: SSizes.spaceBtwItems,
            ),

            // -----------------------------
            // RATING + CATEGORY
            // -----------------------------

            Row(
              children: [
                const Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                  size: 22,
                ),

                const SizedBox(width: 5),

                Text(
                  book.rating.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),

                const SizedBox(width: 20),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withAlpha(30),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    book.category,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: SSizes.spaceBtwSections,
            ),

            // -----------------------------
            // ABOUT THE BOOK
            // -----------------------------

            Text(
              'About this book',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 10),

            Text(
              'Explore ${book.title} by ${book.author}. '
              'This book provides valuable insights and ideas '
              'that you can apply to your everyday life.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(
              height: SSizes.spaceBtwSections,
            ),

            // -----------------------------
            // PREVIEW BUTTON
            // -----------------------------

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Open book reader / preview
                },
                icon: const Icon(
                  Icons.menu_book_rounded,
                ),
                label: const Text(
                  'Preview Book',
                ),
              ),
            ),

            const SizedBox(height: 12),

            // -----------------------------
            // ADD TO LIBRARY
            // -----------------------------

            SizedBox(
              width: double.infinity,
              height: 55,
              child: OutlinedButton.icon(
                onPressed: () {
                  // Add book to library
                },
                icon: const Icon(
                  Icons.library_add_outlined,
                ),
                label: const Text(
                  'Add to Library',
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}