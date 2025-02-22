import 'package:book_app/Core/utilities/constants.dart';
import 'package:book_app/Core/utilities/snak_bar.dart';
import 'package:book_app/Core/utilities/styles.dart';
import 'package:book_app/Features/home/data/models/book_model/book.model.dart';
import 'package:book_app/Features/home/presentation/manager/add_shopping_cart_cubit.dart/add_shopping_cart_cubit.dart';
import 'package:book_app/Features/home/presentation/views/widgets/book_rating_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksBodyCart extends StatelessWidget {
  const BooksBodyCart({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(bookModel.id ?? ''),
      direction: DismissDirection.horizontal,
      onDismissed: (direction) {
        BlocProvider.of<AddShoppingCartCubit>(context).deleteBook(bookModel);

        scaffoldmessenger(context: context, text: 'Delete book', color: Colors.red);
      },
      background: Container(
        color: Colors.red, // Background color when swiped
        alignment: Alignment.centerLeft,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.green, // Background color when swiped the other way
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.21,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 0.68,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ??
                        'http://books.google.com/books/content?id=7m9FAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
                    fit: BoxFit.fill,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(color: Colors.blue),
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/images/test_image.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.075,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bookModel.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.004,
                    ),
                    Text(
                      bookModel.volumeInfo.authors?[0] ?? 'Mark',
                      style: Styles.textStyle14,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      children: [
                        Text(
                          'Free',
                          style: Styles.textStyle20.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.15,
                        ),
                        BookRating(
                          bookRating: bookModel.volumeInfo.averageRating ?? 0,
                          count: bookModel.volumeInfo.ratingsCount ?? 0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
