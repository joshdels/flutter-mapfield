import 'package:flutter/material.dart';
import 'app_colors_theme.dart';

class AppTextTheme {
  static TextTheme textTheme = const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
    bodyLarge: TextStyle(fontSize: 16, color: AppColors.textPrimary),
    bodyMedium: TextStyle(fontSize: 14, color: AppColors.textSecondary),
  );
}