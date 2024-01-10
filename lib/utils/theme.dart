import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.C_121212,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.C_121212,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.C_121212,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    cardColor: AppColors.C_363636,
    canvasColor: AppColors.C_8687E7,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.C_121212),
    textTheme: TextTheme(
      //display
      displayLarge: TextStyle(
          color: AppColors.textColor,
          fontSize: 57.sp,
          fontWeight: FontWeight.w800,
          fontFamily: "Poppins"),
      displayMedium: TextStyle(
          color: AppColors.textColor,
          fontSize: 45.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "Poppins"),
      displaySmall: TextStyle(
          color: AppColors.textColor,
          fontSize: 36.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins"),
      //headline
      headlineLarge: TextStyle(
          color: AppColors.textColor,
          fontSize: 32.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "Poppins"),
      headlineMedium: TextStyle(
          color: AppColors.textColor,
          fontSize: 28.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      headlineSmall: TextStyle(
          color: AppColors.textColor,
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "Poppins"),

      //title
      titleLarge: TextStyle(
          color: AppColors.textColor,
          fontSize: 22.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "Poppins"),
      titleMedium: TextStyle(
          color: AppColors.textColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins"),
      titleSmall: TextStyle(
          color: AppColors.textColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      //label
      labelLarge: TextStyle(
          color: AppColors.textColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins"),
      labelMedium: TextStyle(
          color: AppColors.textColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      labelSmall: TextStyle(
          color: AppColors.textColor,
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      //body
      bodySmall: TextStyle(
          color: AppColors.textColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      bodyMedium: TextStyle(
          color: AppColors.C_AFAFAF,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      bodyLarge: TextStyle(
          color: AppColors.textColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.white),
  );
}
