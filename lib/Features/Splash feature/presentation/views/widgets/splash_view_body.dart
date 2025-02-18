import 'package:book_app/Core/utilities/app_router.dart';
import 'package:book_app/Features/Auth/data/repo/repo_implement.dart';
import 'package:book_app/Features/Splash%20feature/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:book_app/Core/utilities/assets.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin // detect the time and value of variable
{
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initslidinganimation();
    navigatetohome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        SizedBox(
          height: 10,
        ),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initslidinganimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    slidingAnimation = Tween<Offset>(
      begin: Offset(0, 10),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
    // slidingAnimation.addListener(() {});
    // setState(() {});
  }

  void navigatetohome() {
    Future.delayed(Duration(seconds: 3), () async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      if (sharedPreferences.getBool("GetHome") == true) {
        if (!AuthRepoImplement().isLoggedIn()) {
          GoRouter.of(context).pushReplacement(AppRouter.kloginview);
        }
        else{
           GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        }
      } else {
        GoRouter.of(context).pushReplacement(AppRouter.konboardingview);
      }

      // Get.to(() => HomeView(),
      //     transition: Transition.fade, duration: Duration(seconds: 2));
    });
  }
}
