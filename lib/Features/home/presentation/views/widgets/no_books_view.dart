import 'package:flutter/material.dart';

class NoBooks extends StatelessWidget {
  const NoBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0), // Add some padding around the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Optional: An image or icon to indicate "no books"
            Icon(
              Icons.book, // Example icon, you can use any relevant image
              size: 80,
              color: Colors.grey,
            ),
            const SizedBox(height: 20), // Space between the icon and text
            Text(
              'No Books in Your Cart',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
               
              ),
            ),
            const SizedBox(height: 10), // Space between the message and button
            Text(
              'Browse our collection and add some books!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          // Space for aesthetics
           
          ],
        ),
      ),
    );
  }
}