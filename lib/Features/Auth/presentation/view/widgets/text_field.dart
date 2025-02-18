// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextFieldAuth extends StatefulWidget {
  const TextFieldAuth({
    super.key,
    required this.text,
    required this.onChanged,
  });

  final String text;
  final void Function(String)? onChanged;

  @override
  State<TextFieldAuth> createState() => _TextFieldAuthState();
}

class _TextFieldAuthState extends State<TextFieldAuth> {
  bool obscureText = true;
  IconData? icon=Icons.visibility_off;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return TextFormField(
      obscureText: widget.text=="Password"?obscureText:false,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      onChanged: widget.onChanged,
      cursorHeight: 20,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            if (widget.text == "Password") {
              if (icon == Icons.visibility_off) {
                icon = Icons.visibility_outlined;
                obscureText = false;
               
              } else if (icon == Icons.visibility_outlined) {
                icon = Icons.visibility_off;
                obscureText = true;
               
              }
             setState(() {});
            }
          },
          child: widget.text == "Password"
              ? Icon(
                   icon,
                  color: Colors.grey,
                )
              : Icon(
                   Icons.check,
                  color: Colors.grey,
                ),
                
        ),
        contentPadding: EdgeInsets.only(
          right: width * 0.02,
          bottom: width * 0.02,
          top: height * 0.03,
        ),
        label: Text(
          widget.text,
          style: TextStyle(
            color: Color(0XFFB81736),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        errorStyle: TextStyle(
          color: Colors.red, // Set a strong error color
          fontWeight: FontWeight.bold, // Make it bold
        ),
      ),
    );
  }
}
