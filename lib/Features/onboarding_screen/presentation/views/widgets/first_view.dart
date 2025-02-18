import 'package:book_app/Features/onboarding_screen/presentation/views/widgets/view_details.dart';
import 'package:flutter/material.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewDetails(image:  'assets/images/book_image.jpg', title:   'Welcome to Book Haven!',subtitle: 'Discover a world of books and immerse yourself in reading like never before.' ,backgroundColor: Color(0XFFFEF9F3),);
  }
}

