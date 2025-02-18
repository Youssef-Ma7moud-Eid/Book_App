
import 'package:book_app/Core/utilities/styles.dart';
import 'package:book_app/Features/home/data/models/book_model/book.model.dart';
import 'package:book_app/Features/home/presentation/views/widgets/book_price_button_review.dart';
import 'package:book_app/Features/home/presentation/views/widgets/book_rating_item.dart';
import 'package:book_app/Features/home/presentation/views/widgets/list_view_feature_item.dart';
import 'package:flutter/material.dart';

class BookdetailsSection extends StatelessWidget {
  const BookdetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              right: width * 0.28, left: width * 0.28, bottom: height * 0.031),
          child: ListViewFeatureItem(
            model: bookModel,
          ),
        ),
        SizedBox(
          width: 330,
          child: Text(
            bookModel.volumeInfo.title ?? 'Book',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Styles.textStyle30.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo.authors?[0] ?? 'Mark',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        BookRating(
          bookRating: bookModel.volumeInfo.averageRating ?? 0,
          count: bookModel.volumeInfo.ratingsCount ?? 0,
        ),
        BookPriceButtomReview(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
