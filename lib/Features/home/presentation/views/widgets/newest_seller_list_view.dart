
import 'package:book_app/Core/utilities/custom_error.dart';
import 'package:book_app/Features/home/presentation/manager/newest%20books%20cubit/newest_books_cubit.dart';
import 'package:book_app/Features/home/presentation/views/widgets/newest_books_shimmer_loading.dart';
import 'package:book_app/Features/home/presentation/views/widgets/newest_seller_feature_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestSellerListView extends StatelessWidget {
  const NewestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return BlocBuilder<NewestBooksCubit, NewestBooksCubitState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: state.books.length,
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.035),
                    child: NewestSellerFeatureItem(bookModel: state.books[index]),
                  ),
                );
              },
            ),
          );
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
            child: CustomError(error: state.errormessage),
          );
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10, // Number of shimmer items
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.035),
                    child: ShimmerLoadingItem(),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}