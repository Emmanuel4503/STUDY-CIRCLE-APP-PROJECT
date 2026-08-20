import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:studycycle/features/cycle/library/widgets/currently_reading.dart';
import 'package:studycycle/features/cycle/library/widgets/downloaded_book_tile.dart';
import 'package:studycycle/features/cycle/library/widgets/featured_book_card.dart';
import 'package:studycycle/features/cycle/library/widgets/library_book_card.dart';
import 'package:studycycle/features/cycle/library/widgets/library_section_header.dart';
import 'package:studycycle/features/cycle/library/widgets/pdf_viewer_page.dart';
import 'package:studycycle/features/cycle/library/widgets/recently_added_books.dart';
import 'package:studycycle/features/cycle/library/widgets/recommended_book_grid.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/widgets/app_double_text.dart';
import 'package:studycycle/utils/widgets/custom_appbar.dart';
import 'package:studycycle/utils/widgets/search_and_filter.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final List<PlatformFile> uploadedDocuments = [];

  Future<void> pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      withData: true,
    );

    if (result != null) {
      setState(() {
        uploadedDocuments.add(result.files.first);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${result.files.first.name} added to your library',
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Library",
      ),
      body: CustomScrollView(
        slivers: [
          // Search Bar
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(SSizes.defaultSpace),
              child: Column(
                children: [
                  SSearchAndFilter(
                    text: "Search in Library",
                  ),
                  SizedBox(
                    height: SSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
          ),

          // Upload Document Button
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: SSizes.defaultSpace,
              ),
              child: OutlinedButton.icon(
                onPressed: pickDocument,
                icon: const Icon(Icons.upload_file),
                label: const Text("Upload Document"),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(
                    double.infinity,
                    50,
                  ),
                ),
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(
              height: SSizes.spaceBtwSections,
            ),
          ),

          // Uploaded Documents
          if (uploadedDocuments.isNotEmpty)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SSizes.defaultSpace,
                ),
                child: AppDoubleText(
                  bigText: "My Documents",
                  smallText: "View All",
                ),
              ),
            ),

          if (uploadedDocuments.isNotEmpty)
            const SliverToBoxAdapter(
              child: SizedBox(
                height: SSizes.spaceBtwItems,
              ),
            ),

          if (uploadedDocuments.isNotEmpty)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final document = uploadedDocuments[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: SSizes.defaultSpace,
                      vertical: 6,
                    ),
                    child: Card(
                      child: ListTile(
                        leading: const Icon(
                          Icons.picture_as_pdf,
                          color: Colors.red,
                          size: 35,
                        ),
                        title: Text(
                          document.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          "${(document.size / 1024).toStringAsFixed(1)} KB",
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                        onTap: () {
                          if (document.bytes != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PdfViewerPage(
                                  fileName: document.name,
                                  bytes: document.bytes!,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  );
                },
                childCount: uploadedDocuments.length,
              ),
            ),

          if (uploadedDocuments.isNotEmpty)
            const SliverToBoxAdapter(
              child: SizedBox(
                height: SSizes.spaceBtwSections,
              ),
            ),


            // currently reading
             const SliverToBoxAdapter(
            child: SizedBox(height: SSizes.spaceBtwItems),
          ),

          const SliverToBoxAdapter(
            child: CurrentlyReadingScreen(),
          ),

          // Popular
          const SliverToBoxAdapter(
            child: LibrarySectionHeader(
              title: 'Popular Books',
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: SSizes.spaceBtwItems),
          ),

          const SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: SSizes.defaultSpace,
            ),
            sliver: PopularBookGrid(),
          ),
          // Featured
          const SliverToBoxAdapter(
            child: LibrarySectionHeader(
              title: 'Featured Books',
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: SSizes.spaceBtwItems),
          ),

          const SliverToBoxAdapter(
            child: FeaturedBookList(),
          ),

          // Popular
          const SliverToBoxAdapter(
            child: LibrarySectionHeader(
              title: 'Popular Books',
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: SSizes.spaceBtwItems),
          ),

          const SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: SSizes.defaultSpace,
            ),
            sliver: PopularBookGrid(),
          ),
// Recently Added
          const SliverToBoxAdapter(
            child: LibrarySectionHeader(
              title: 'Recently Added',
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: SSizes.spaceBtwItems),
          ),

          const SliverToBoxAdapter(
            child: RecentlyAddedBooks(),
          ),

          // Recommended
          const SliverToBoxAdapter(
            child: LibrarySectionHeader(
              title: 'Recommended For You',
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: SSizes.spaceBtwItems),
          ),

          const SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: SSizes.defaultSpace,
            ),
            sliver: RecommendedBookGrid(),
          ),
 // Downloaded
          const SliverToBoxAdapter(
            child: LibrarySectionHeader(
              title: 'Downloaded Books',
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: SSizes.spaceBtwItems),
          ),

          const SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: SSizes.defaultSpace,
            ),
            sliver: DownloadedBookList(),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 40),
          ),
        ],
      ),
    );
  }
}
