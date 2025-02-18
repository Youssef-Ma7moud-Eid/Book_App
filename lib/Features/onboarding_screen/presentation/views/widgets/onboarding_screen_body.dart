import 'package:book_app/Features/onboarding_screen/presentation/views/widgets/buttom_section.dart';
import 'package:book_app/Features/onboarding_screen/presentation/views/widgets/first_view.dart';
import 'package:book_app/Features/onboarding_screen/presentation/views/widgets/second_view.dart';
import 'package:book_app/Features/onboarding_screen/presentation/views/widgets/thired_view.dart';
import 'package:flutter/material.dart';


class OnboardingScreenBody extends StatefulWidget {
  const OnboardingScreenBody({super.key});

  @override
  State<OnboardingScreenBody> createState() => _OnboardingScreenBodyState();
}

class _OnboardingScreenBodyState extends State<OnboardingScreenBody> {
   PageController pageController = PageController();
  bool islastscreen = false;
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          onPageChanged: (page) {
            if (page == 2) {
              setState(() {
                islastscreen = true;
                index = 3;
              });
            } else if (page == 1) {
              setState(() {
                index = 2;
                islastscreen = false;
              });
            } else {
              setState(() {
                index = 1;
                islastscreen = false;
              });
            }
          },
          controller: pageController,
          children: const[
             FirstView(),
            SecondView(),
            ThirdView(),
          ],
        ),
        ButtomSection(
          index: index,
          controller: pageController,
          islastscreen: islastscreen,
        ),
      ],
    );
  }
}
