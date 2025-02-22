
import 'package:book_app/Features/home/data/models/book_model/book.model.dart';
import 'package:book_app/Features/home/presentation/views/widgets/book_details_section.dart';
import 'package:book_app/Features/home/presentation/views/widgets/custom_app_bar_book_details.dart';
import 'package:book_app/Features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDatailsViewBody extends StatelessWidget {
  const BookDatailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomAppBarBookDetails(model: bookModel),
          BookdetailsSection(
            bookModel: bookModel,
          ),
          SimilarBooksSection(),
        ],
      ),
    );
  }
}
