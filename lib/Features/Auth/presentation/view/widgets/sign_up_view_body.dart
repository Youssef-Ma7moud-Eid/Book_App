
import 'package:book_app/Features/Auth/presentation/view/widgets/sign_body_section.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [
                  Color(0XFFB81736),
                  Color(0XFF281537),
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.08, top: height * 0.095),
              child: Text(
                'Hello\nSign Up!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
         SignBodySection(),
        ],
      ),
    );
  }
}


