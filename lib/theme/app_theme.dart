import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color black = Colors.black;
  static Color primaryColor = const Color(0xff42f578);
  static Color textColor = const Color(0xffffffff);

  static double appPading = 20;

  static TextStyle textStyle({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    double height = 1,
  }) {
    return GoogleFonts.kanit(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
    );
  }
}
