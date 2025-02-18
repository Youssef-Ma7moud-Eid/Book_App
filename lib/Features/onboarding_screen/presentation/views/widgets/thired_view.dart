import 'package:book_app/Features/onboarding_screen/presentation/views/widgets/view_details.dart';
import 'package:flutter/material.dart';

class ThirdView extends StatelessWidget {
  const ThirdView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewDetails(image: 'assets/images/second_image.jpg', title:  'Join Our Reading Community!', subtitle:   'Connect with fellow readers, share your thoughts, and enjoy your reading journey.',backgroundColor:  const Color.fromARGB(255, 255, 255, 255),);
   
  }
}