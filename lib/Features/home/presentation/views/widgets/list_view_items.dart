
import 'package:book_app/Core/utilities/custom_error.dart';
import 'package:book_app/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_app/Features/home/presentation/views/widgets/item_feature_shimmer_loading.dart';
import 'package:book_app/Features/home/presentation/views/widgets/list_view_feature_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewItems extends StatelessWidget {
  const ListViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<Featuredbookcubit, FeaturedbookscubitState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          var list = state.books;
          return Padding(
            padding: EdgeInsets.only(bottom: height * 0.055),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.27,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: list.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.015),
                    child: ListViewFeatureItem(
                      model: list[index],
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomError(
            error: state.errormessage,
          );
        } else {
          return  Padding(
            padding: EdgeInsets.only(bottom: height * 0.055),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.27,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.015),
                    child:ItemFeatureShimmerLoading(),
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
