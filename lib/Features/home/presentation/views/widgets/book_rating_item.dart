import 'package:book_app/Core/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.bookRating, required this.count});
  final num bookRating;
  final num count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0XFFFFDD4D),
          size: 17,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
        bookRating.toString(),
          style: Styles.textStyle16,
        ),
        Opacity(
          opacity: 0.5,
          child: Text(
            ' ($count)',
            style: Styles.textStyle14,
          ),
        ),
      ],
    );
  }
}
