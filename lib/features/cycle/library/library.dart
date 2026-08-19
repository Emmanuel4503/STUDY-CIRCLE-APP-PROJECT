import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:studycycle/features/cycle/library/widgets/pdf_viewer_page.dart';
import 'package:studycycle/features/cycle/library/widgets/book_display.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/storage/dummy_data.dart';
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

          // Popular Books
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SSizes.defaultSpace,
              ),
              child: AppDoubleText(
                bigText: "Popular Books",
                smallText: "View All",
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(
              height: SSizes.spaceBtwItems,
            ),
          ),

          BookDisplay(
            count: DummyData.books.length - 4,
          ),

          const SliverToBoxAdapter(
            child: SizedBox(
              height: SSizes.spaceBtwSections,
            ),
          ),

          // Featured Books
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SSizes.defaultSpace,
              ),
              child: AppDoubleText(
                bigText: "Featured Books",
                smallText: "View All",
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(
              height: SSizes.spaceBtwItems,
            ),
          ),

          BookDisplay(
            count: DummyData.books.length,
          ),
        ],
      ),
    );
  }
}
