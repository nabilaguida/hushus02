import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyColors {
  static const Color primaryColor = Color(0xffFC6E2A);
  static const Color textColor = Color(0xff676767);
  static const Color darkColor = Color(0xff121223);
// Add more colors as needed
}
class MyTextStyles {
  final primetext = GoogleFonts.sen(
    color: MyColors.primaryColor,
    fontSize: 16.0,
  );
  final darktext = GoogleFonts.sen(
    color: MyColors.darkColor,
    fontSize: 16.0,
  );

  static const TextStyle boldTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: MyColors.textColor,
    fontSize: 18.0,
  );

  static const TextStyle italicTextStyle = TextStyle(
    fontStyle: FontStyle.italic,
    color: MyColors.textColor,
    fontSize: 16.0,
  );
// Add more text styles as needed
}