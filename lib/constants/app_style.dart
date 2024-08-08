// This class defines app themes, text themes, and input field decoration themes.

import 'package:after_market_mobile_application/constants/app_colors.dart';
import 'package:after_market_mobile_application/constants/app_fonts.dart';
import 'package:flutter/material.dart';

class AppStyle {
  // common app theme
  static ThemeData appTheme() {
    return ThemeData(
      useMaterial3: false,
      fontFamily: AppFonts.robotoRegular,
      primaryColor: AppColors.orange,
      iconTheme: const IconThemeData(
        color: AppColors.orange,
      ),
      textTheme: textTheme(),
      scaffoldBackgroundColor: AppColors.white,
    );
  }

  // common text theme
  static TextTheme textTheme() {
    return const TextTheme(
      labelSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      color: AppColors.white,
        fontFamily: AppFonts.robotoRegular,
      ),
      headlineSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
        fontFamily: AppFonts.robotoRegular,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        fontFamily: AppFonts.robotoRegular,
      ),
      headlineLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
        fontFamily: AppFonts.robotoRegular,
      ),
    );
  }
}

// common outline input border
OutlineInputBorder outlineInputBorder({
  bool isError = false,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      10,
    ),
    borderSide: BorderSide(
      color: isError ? AppColors.redShade : AppColors.greyShade,
    ),
  );
}

// common underline input border
UnderlineInputBorder underlineInputBorder({
  bool isError = false,
}) {
  return UnderlineInputBorder(
    borderSide: BorderSide(
      color: isError ? AppColors.redShade : AppColors.greyShade,
    ),
  );
}

// custom box shadow
BoxShadow boxShadow() {
  return BoxShadow(
    color: AppColors.black.withOpacity(0.2),
    offset: const Offset(0, 3),
    spreadRadius: 2,
    blurRadius: 5,
  );
}
