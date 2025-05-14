import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidgets {
  static textStyle({
    Color? fontColor,
    FontWeight? fontWeight,
    double? fontSize,
    FontStyle? fontStyle,
    TextDecoration ? textDecoration
  }) {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: fontColor,
        fontStyle: fontStyle,
        decoration: textDecoration
      ),
    );
  }

}

