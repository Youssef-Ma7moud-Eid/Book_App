import 'package:book_app/Core/utilities/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ButtomSection extends StatefulWidget {
  const ButtomSection(
      {super.key, required this.controller, required this.islastscreen, required this.index});
  final PageController controller;
  final bool islastscreen;
  final int index;
  @override
  State<ButtomSection> createState() => _ButtomSectionState();
}

class _ButtomSectionState extends State<ButtomSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SmoothPageIndicator(controller: widget.controller, count: 3),
          SizedBox(
            height: 10,
          ),
          CircularPercentIndicator(
            radius: 40,
            animation: true,
            animationDuration: 300,
            percent: widget.index/3,
            animateFromLastPercent: true,
            progressColor: Colors.deepPurpleAccent,
            center: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.deepPurpleAccent,
              child: IconButton(
                onPressed: () {
                  widget.controller.nextPage(
                      duration: Duration(microseconds: 500),
                      curve: Curves.ease);
                },
                icon: Icon(
                  widget.islastscreen == true
                      ? Icons.check
                      : Icons.keyboard_arrow_right,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          widget.islastscreen
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: TextButton(
                    onPressed: () async{
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                  sharedPreferences.setBool("GetHome",true);
                      GoRouter.of(context).pushReplacement(AppRouter.kloginview);
                    },
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.deepPurpleAccent,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: TextButton(
                    onPressed: () async {
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
             sharedPreferences.setBool("GetHome",true);
                         GoRouter.of(context).pushReplacement(AppRouter.kloginview);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.deepPurpleAccent,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
