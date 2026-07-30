import 'package:flutter/material.dart';
import 'package:studycycle/features/cycle/library/model/book_model.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {},

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Book Cover
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                book.coverImage,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 10),

          /// Book Title
          Text(
            book.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium,
          ),

          const SizedBox(height: 4),

          /// Author
          Text(
            book.author,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),

          const SizedBox(height: 6),

          /// Rating
          Row(
            children: [
              const Icon(
                Icons.star_rounded,
                size: 18,
                color: Colors.amber,
              ),
              const SizedBox(width: 4),
              Text(
                book.rating.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}