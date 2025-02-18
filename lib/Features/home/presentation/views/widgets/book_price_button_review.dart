
import 'package:book_app/Core/utilities/function/launch_url.dart';
import 'package:book_app/Core/widgets/custom_buttom.dart';
import 'package:book_app/Features/home/data/models/book_model/book.model.dart';
import 'package:flutter/material.dart';

class BookPriceButtomReview extends StatelessWidget {
  const BookPriceButtomReview({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.083, vertical: height * 0.04),
      child: Row(
        children: [
          Expanded(
            child: CustomButtom(
              text: 'Free',
              backgroundcolor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButtom(
              onPressed: () async {
                await launchCustomUrl(
                    context, bookModel.volumeInfo.previewLink);
              },
              text: getText(bookModel),
              backgroundcolor: Color(0XFFEF8262),
              textColor: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              fontsize: 17,
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not Avaliable';
    } else {
      return 'Free Preview';
    }
  }
}
