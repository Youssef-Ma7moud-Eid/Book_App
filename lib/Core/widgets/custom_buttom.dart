import 'package:book_app/Core/utilities/styles.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom(
      {super.key,
      required this.backgroundcolor,
      required this.textColor,
      this.borderRadius,
      required this.text,
      this.fontsize, this.onPressed});
  final Color backgroundcolor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String text;
  final double? fontsize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed:onPressed, // Action to perform when the button is pressed
        style: TextButton.styleFrom(
          backgroundColor: backgroundcolor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ??
                BorderRadius.circular(12), // Rounded top-left corner
          ),
        ),
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
            color: textColor,
            fontWeight: FontWeight.w900,
            fontSize: fontsize,
          ),
        ),
      ),
    );
  }
}
