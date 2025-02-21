import 'package:book_app/Core/theme/cubit/theme_state.dart';
import 'package:book_app/Core/utilities/helper/cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(AppInitialState()) {
    _loadTheme();
  }

  static ThemeCubit get(context) => BlocProvider.of(context);

  ThemeModeState currentTheme = ThemeModeState.system;

  Future<void> setTheme(ThemeModeState theme) async {
    currentTheme = theme;
    getThemeMode();
    emit(ThemeChanged(themeMode: getThemeMode()));

    await CacheHelper.saveData(key: 'themeMode', value: currentTheme.name);
  }

  Future<void> _loadTheme() async {
    String? savedTheme = await CacheHelper.getData(key: 'themeMode');

    if (savedTheme != null) {
      currentTheme = ThemeModeState.values.firstWhere(
        (e) => e.name == savedTheme,
        orElse: () => ThemeModeState.system,
      );
    }

    emit(ThemeChanged(themeMode: getThemeMode()));
  }

  ThemeMode getThemeMode() {
    switch (currentTheme) {
      case ThemeModeState.dark:
        return ThemeMode.dark;
      case ThemeModeState.light:
        return ThemeMode.light;
      case ThemeModeState.system:
        return ThemeMode.system;
    }
  }
}

enum ThemeModeState { light, dark, system }
