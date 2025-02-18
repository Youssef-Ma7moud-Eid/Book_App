
import 'package:book_app/Features/home/data/models/book_model/book.model.dart';
import 'package:book_app/Features/home/presentation/views/widgets/book_datails_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SafeArea(
          child: BookDatailsViewBody(
        bookModel: widget.bookModel,
      )),
    );
  }
}
