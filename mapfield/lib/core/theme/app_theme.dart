import 'package:flutter/material.dart';
import 'app_colors_theme.dart';
import 'app_text_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),

    scaffoldBackgroundColor: AppColors.background,

    textTheme: AppTextTheme.textTheme,

    appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
  );
}
