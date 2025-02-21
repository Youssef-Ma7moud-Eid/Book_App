import 'package:flutter/material.dart';

abstract class ThemeState {}

final class AppInitialState extends ThemeState {}

class ThemeChanged extends ThemeState {
  final ThemeMode themeMode;
  ThemeChanged({required this.themeMode});
}
