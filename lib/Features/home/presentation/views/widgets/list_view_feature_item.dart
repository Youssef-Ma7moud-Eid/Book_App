
import 'package:book_app/Core/utilities/app_router.dart';
import 'package:book_app/Features/home/data/models/book_model/book.model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListViewFeatureItem extends StatelessWidget {
  const ListViewFeatureItem({super.key, required this.model});

  final BookModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
 GoRouter.of(context).push(AppRouter.kbookDetailview,extra: model);
      },
      child: AspectRatio(
        aspectRatio: 0.65,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: model.volumeInfo.imageLinks?.thumbnail ?? 'http://books.google.com/books/content?id=7m9FAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
            fit: BoxFit.fill,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            ),
            errorWidget: (context, url, error) =>
                Image.asset('assets/images/test_image.png', fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
