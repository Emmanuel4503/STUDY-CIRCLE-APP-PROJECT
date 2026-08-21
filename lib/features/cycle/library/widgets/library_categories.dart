import 'package:flutter/material.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class LibraryCategories extends StatelessWidget {
  const LibraryCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      'All',
      'Academics',
      'Self-Help',
      'Bestsellers',
      'Fiction & Novels',
      'Historical',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SSizes.defaultSpace,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            'Categories',
            style: Theme.of(context).textTheme.titleLarge,
          ),

          const SizedBox(height: SSizes.spaceBtwItems),

          SizedBox(
            height: 42,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(width: 10),
              itemBuilder: (context, index) {

                final selected = index == 0;

                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: selected
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: selected
                          ? Theme.of(context).primaryColor
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color: selected
                          ? Colors.white
                          : Colors.black87,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}