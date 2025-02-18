
import 'package:book_app/Core/utilities/styles.dart';
import 'package:book_app/Features/home/presentation/views/widgets/similar_books_list_views.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: width * 0.045, top: height * 0.015, bottom: height * 0.022),
          child: Text(
            'You can also like',
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 15.7,
            ),
          ),
        ),
        SimilarBooksListViews(),
      ],
    );
  }
}
