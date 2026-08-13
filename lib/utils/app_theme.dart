import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.whiteColor,
    splashColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      iconTheme: IconThemeData(color: AppColors.blackColor),
      scrolledUnderElevation: 0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      headlineSmall: AppStyles.bold24White,
      headlineMedium: AppStyles.medium24Black,
      headlineLarge: AppStyles.medium20Black,
      titleLarge: AppStyles.bold20Black,
      titleMedium: AppStyles.medium20Black,
      titleSmall: AppStyles.medium14White,
      bodyLarge: AppStyles.medium14Black,
      bodyMedium: AppStyles.medium12Black,
      bodySmall: AppStyles.medium12Grey,
      labelLarge: AppStyles.bold16Black,
      labelMedium: AppStyles.medium14Black,
      labelSmall: AppStyles.medium12Grey,
      displayLarge: AppStyles.medium36White,
      displayMedium: AppStyles.medium20White,
      displaySmall: AppStyles.bold16Black,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.blackColor,
    splashColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.blackColor,
      iconTheme: IconThemeData(color: AppColors.whiteColor),
      centerTitle: true,
    ),
    textTheme: TextTheme(
      headlineSmall: AppStyles.bold24Black,
      headlineMedium: AppStyles.medium24White,
      headlineLarge: AppStyles.medium20White,
      titleLarge: AppStyles.bold20White,
      titleMedium: AppStyles.medium20White,
      titleSmall: AppStyles.medium14Black,
      bodyLarge: AppStyles.medium14White,
      bodyMedium: AppStyles.medium12White,
      bodySmall: AppStyles.medium12Grey,
      labelLarge: AppStyles.bold16White,
      labelMedium: AppStyles.medium14White,
      labelSmall: AppStyles.medium12Grey,
      displayLarge: AppStyles.medium36Black,
      displayMedium: AppStyles.medium20Black,
      displaySmall: AppStyles.bold16White,
    ),
  );
}
