import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kPrimaryColor = Colors.white;

final light = ThemeData(
  scaffoldBackgroundColor: kPrimaryColor,
  textTheme: GoogleFonts.montserratTextTheme(
    ThemeData.light().textTheme,
  ),
);