import 'package:book_app/Core/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final dark = ThemeData(
  scaffoldBackgroundColor: kPrimaryColor,
  textTheme: GoogleFonts.montserratTextTheme(
  ThemeData.dark().textTheme,
   ),
);
