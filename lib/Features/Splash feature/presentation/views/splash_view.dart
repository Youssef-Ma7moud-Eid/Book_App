import 'package:book_app/Core/utilities/constants.dart';
import 'package:book_app/Features/Splash%20feature/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: const SplashViewBody(),
    );
  }
}
