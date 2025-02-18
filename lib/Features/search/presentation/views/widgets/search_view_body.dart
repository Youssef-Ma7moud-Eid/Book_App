import 'package:book_app/Core/utilities/styles.dart';
import 'package:book_app/Features/search/presentation/views/widgets/best_seller_list_from_search.dart';
import 'package:book_app/Features/search/presentation/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.035, vertical: height * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextField(),
          SizedBox(
            height: height * 0.032,
          ),
          Text(
            'Search Result',
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Expanded(child: BestSellerFromSearch()),
        ],
      ),
    );
  }
}
