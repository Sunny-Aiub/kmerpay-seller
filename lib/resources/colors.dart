
import 'dart:math';

import 'package:flutter/material.dart';

class ColorManager {

  static Color brandColor = HexColor.fromHex("#F12679");
  static Color deepBlack = HexColor.fromHex("#172739");
  static Color smallTextBlack = HexColor.fromHex("#393F4F");

  static Color green = HexColor.fromHex("#0DB050");


  static Color grey4 = HexColor.fromHex("#BDBDBD");
  static Color grayLight = HexColor.fromHex("#828282");
  static Color grayBorder = HexColor.fromHex("#DDE2E9");

  static Color blueTextColor = HexColor.fromHex("#2C80FE");
  static Color inactiveTabColor = HexColor.fromHex("#EDA0BF");

  static Color uiBackgroundColor = HexColor.fromHex("#F4F5F8");

  static List<Color> circleColors = [brandColor, blueTextColor, Colors.green];
  static Color randomGenerator() {
    return circleColors[Random().nextInt(2)];
  }

  ///primary colors
  static Color primaryBlue = HexColor.fromHex("#235EFA");
  static Color primaryBlack = HexColor.fromHex("#34373F");
  static Color primaryWhite = HexColor.fromHex("#FFFFFF");
  static Color primaryGreen = HexColor.fromHex("#189E3D");
  static Color primaryRed = HexColor.fromHex("#ED4B27");

///greyscales colors
  static Color bluishGrey = HexColor.fromHex("#676F85");
  static Color silver = HexColor.fromHex("#9AA0AD");
  static Color offWhite = HexColor.fromHex("#DFDFDF");
  static Color lightWhite = HexColor.fromHex("#FCFCFC");
  static Color backBlue = HexColor.fromHex("#4E6FE8");

}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}