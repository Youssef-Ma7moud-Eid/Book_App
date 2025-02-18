import 'package:flutter/material.dart';

void ShowSnakBar(context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}