import 'package:flutter/material.dart';

void scaffoldmessenger(
    {required BuildContext context,
    required String text,
    required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      behavior: SnackBarBehavior.fixed,
      backgroundColor: color,
      showCloseIcon: true,
      closeIconColor: Colors.white,
      content: Text(
        text,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    ),
  );
}
