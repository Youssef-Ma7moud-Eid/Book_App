import 'package:book_app/Core/utilities/custom_error.dart';
import 'package:book_app/Features/home/presentation/views/widgets/newest_books_shimmer_loading.dart';
import 'package:book_app/Features/home/presentation/views/widgets/newest_seller_feature_item.dart';
import 'package:book_app/Features/search/presentation/manager/search_item_books_cubit.dart/search_item_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerFromSearch extends StatelessWidget {
  const BestSellerFromSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchItemBooksCubit, SearchItemBooksState>(
      builder: (context, state) {
        if (state is SearchItemBooksInitiaSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: NewestSellerFeatureItem(
                  bookModel: state.books[index],
                ),
              );
            },
          );
        } else if (state is SearchItemBooksFauilre) {
          return CustomError(error: state.errormessage);
        } else if (state is SearchItemBooksLoading) {
          return ListView.builder(
            itemCount: 10,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ShimmerLoadingItem(),
              );
            },
          );
        }else {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.book, // Book icon
          size: 60,
          color: Colors.grey[400], // Light grey color for the icon
        ),
        SizedBox(height: 20), // Spacing between icon and text
        Text(
          'No books available',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          // Darker grey for better readability
          ),
        ),
        SizedBox(height: 10), // Spacing for the subtitle
        Text(
          'Please try a different search.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey, // Lighter grey for the subtitle
          ),
        ),
        SizedBox(height: 30), // Spacing for button
       
      ],
    ),
  );
}
      },
    );
  }
}
