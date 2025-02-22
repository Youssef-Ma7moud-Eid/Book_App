import 'package:book_app/Core/utilities/styles.dart';
import 'package:book_app/Features/home/data/models/book_model/book.model.dart';
import 'package:book_app/Features/home/presentation/manager/add_shopping_cart_cubit.dart/add_shopping_cart_cubit.dart';
import 'package:book_app/Features/home/presentation/views/widgets/books_body_cart.dart';
import 'package:book_app/Features/home/presentation/views/widgets/no_books_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingView extends StatelessWidget {
  const ShoppingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        elevation: 4.0,
        title: Text(
          'Shopping',
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: BlocBuilder<AddShoppingCartCubit, AddShoppingCartState>(
        builder: (context, state) {
          if (state is AddShoppingCartSuccess) {
            List<BookModel>list=state.list.toList();

            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return BooksBodyCart(bookModel: list[index]); // Assuming BooksBodyCart takes a book object
              },
            );
          } else {
            return NoBooks(); // Show no books view if the cart is empty or in another state
          }
        },
      ),
    );
  }
}
         



