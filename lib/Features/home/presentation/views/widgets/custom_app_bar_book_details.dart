import 'package:book_app/Core/utilities/snak_bar.dart';
import 'package:book_app/Features/home/data/models/book_model/book.model.dart';
import 'package:book_app/Features/home/presentation/manager/add_shopping_cart_cubit.dart/add_shopping_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarBookDetails extends StatelessWidget {
  const CustomAppBarBookDetails({super.key, required this.model});
  final BookModel model;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.03,
          right: width * 0.03,
          top: height * 0.01,
          bottom: height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(
              Icons.close,
              size: 28,
            ),
          ),
          IconButton(
            onPressed: () {
              scaffoldmessenger(context: context, text: 'Add book successful', color: Colors.green);
              BlocProvider.of<AddShoppingCartCubit>(context).addBooks(model);
                BlocProvider.of<AddShoppingCartCubit>(context).getBooks();
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
