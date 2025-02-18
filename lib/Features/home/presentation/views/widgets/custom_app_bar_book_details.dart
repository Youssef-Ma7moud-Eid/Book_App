import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarBookDetails extends StatelessWidget {
  const CustomAppBarBookDetails({super.key});

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
            onPressed: () {},
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
