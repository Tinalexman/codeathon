import 'package:codeathon/core/ui/colors.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightThemeData = FlexThemeData.light(
  fontFamily: "PlusJakartaSans",
  useMaterial3: true,
  scheme: FlexScheme.shadOrange,
  appBarStyle: FlexAppBarStyle.scaffoldBackground,
  visualDensity: VisualDensity.compact,
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  scaffoldBackground: AppColors.background,
  surfaceTint: Colors.transparent,
  appBarElevation: 1.0,
);

class AppTextStyles {
  static TextStyle get bold => GoogleFonts.outfit(
    color: AppColors.dark,
    fontWeight: FontWeight.w700,
    height: 1.5,
    letterSpacing: -0.03,
  );

  static TextStyle get semiBold => GoogleFonts.outfit(
    color: AppColors.dark,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: -0.02,
  );

  static TextStyle get medium => GoogleFonts.outfit(
    color: AppColors.grey,
    fontWeight: FontWeight.w500,
    height: 1.5,
    letterSpacing: -0.02,
  );

  static TextStyle get regular => GoogleFonts.outfit(
    color: AppColors.grey,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: -0.02,
  );
}
