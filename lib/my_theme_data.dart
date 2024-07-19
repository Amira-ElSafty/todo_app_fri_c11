import 'package:flutter/material.dart';
import 'package:flutter_app_todo_fri_c11/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  /// light theme , dark theme
  static final ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.backgroundLightColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.primaryColor,
          showUnselectedLabels: false,
          unselectedItemColor: AppColors.grayColor,
          backgroundColor: Colors.transparent,
          elevation: 0),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColor,
          shape: StadiumBorder(
              side: BorderSide(color: AppColors.whiteColor, width: 4))
          // RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(32),
          //   side: BorderSide(
          //     color: AppColors.whiteColor,
          //     width: 4
          //   )
          // )
          ),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor),
        titleMedium: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor),
        titleSmall: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor),
        bodySmall: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: AppColors.blackColor),
      ));
}
