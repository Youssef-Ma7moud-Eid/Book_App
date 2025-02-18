
import 'package:book_app/Core/utilities/custom_error.dart';
import 'package:book_app/Features/home/presentation/manager/similar_books_cubit/cubit/similar_books_cubit.dart';
import 'package:book_app/Features/home/presentation/views/widgets/list_view_feature_item.dart';
import 'package:book_app/Features/home/presentation/views/widgets/similar_books_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListViews extends StatelessWidget {
  const SimilarBooksListViews({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<SimilarBooksCubit, FetchSimilarBooksState>(
      builder: (context, state) {
        if (state is FetchSimilarBooksSuccess) {
  return Padding(
    padding: EdgeInsets.only(left: width * 0.035),
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.16,
      child: ListView.builder(
        itemCount: state.bookmodel.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ListViewFeatureItem(
              model: state.bookmodel[index],
            ),
          );
        },
      ),
    ),
  );
}
else if (state is FetchSimilarBooksFauilre) {
  return CustomError(
            error: state.errormessage,
          );
}
else{
  
 return Padding(
    padding: EdgeInsets.only(left: width * 0.035),
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.16,
      child: ListView.builder(
        itemCount:10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SimilarBooksShimmer(
            ),
          );
        },
      ),
    ),
  );
}
      },
    );
  }
}
