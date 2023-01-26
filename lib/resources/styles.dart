import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'fonts.dart';

TextStyle getTextStyle(
    double fontSize, FontWeight fontWeight, Color color) {
  return GoogleFonts.poppins(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight);
}


TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, Color color) {
  return GoogleFonts.poppins(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight);
}

/// Semi Bold H1 style
TextStyle getSemiBoldStyle(
    {required double fontSize, required Color color}) {
  return _getTextStyle(
      fontSize,  FontWeightManager.semiBold, color);
}

// regular style
TextStyle getRegularStyle(
    {required double fontSize, required Color color}) {
  return _getTextStyle(
      fontSize,  FontWeightManager.regular, color);
}
// Semi Bold style
TextStyle getMediumStyle(
    {required double fontSize, required Color color}) {
  return _getTextStyle(
      fontSize,  FontWeightManager.medium, color);
}
