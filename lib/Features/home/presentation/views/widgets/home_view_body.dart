import 'package:book_app/Core/utilities/styles.dart';
import 'package:book_app/Features/home/presentation/views/widgets/custom_app_bar_howe_view.dart';
import 'package:book_app/Features/home/presentation/views/widgets/list_view_items.dart';
import 'package:book_app/Features/home/presentation/views/widgets/newest_seller_list_view.dart';

import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
      SliverToBoxAdapter(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              ListViewItems(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Text(
                  'Newest Seller',
                  style: Styles.textStyle18.copyWith(
                    fontSize: height * 0.0285,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.035,
              ),
            ],
          ),
        ),
      ),
    
         NewestSellerListView(),
      
    ]);
  }
}
