import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth({super.key, this.onTap, required this.text});
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height * 0.07,
        width: width * 0.76,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: const [
              Color(0XFFB81736),
              Color(0XFF281537),
            ],
          ),
        ),
        child: Text(
         text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
