import 'package:book_app/Features/onboarding_screen/presentation/views/widgets/view_details.dart';
import 'package:flutter/material.dart';

class SecondView extends StatelessWidget {
  const SecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewDetails(
      image: 'assets/images/first_mage.png',
      title: 'Dive into a New Adventure',
      subtitle:
          'Explore genres, discover new authors, and find your next great read.',
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    );
  }
}
