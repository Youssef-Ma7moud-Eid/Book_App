import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Error'),
      content: Text(error),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog or widget
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
