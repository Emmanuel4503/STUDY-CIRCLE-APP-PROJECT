class BookModel {
  final String title;
  final String author;
  final String coverImage;
  final double rating;
  final String category;
  final int totalPages;
  final int currentPage;

  const BookModel({
    required this.title,
    required this.author,
    required this.coverImage,
    required this.rating,
    required this.category,
    required this.totalPages,
    required this.currentPage,
  });

  double get progress {
    if (totalPages == 0) {
      return 0.0;
    }

    return currentPage / totalPages;
  }
}