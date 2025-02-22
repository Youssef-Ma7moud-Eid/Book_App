import 'package:flutter/material.dart';

class ShoppingHomeView extends StatelessWidget {
  const ShoppingHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/no_books.jpg"),
          fit: BoxFit.fill, // Changed to cover for better responsiveness
        ),
      ),
     
      
    );
  }
}