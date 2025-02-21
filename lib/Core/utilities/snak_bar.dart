import 'package:flutter/material.dart';

void showSnakBar(context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}