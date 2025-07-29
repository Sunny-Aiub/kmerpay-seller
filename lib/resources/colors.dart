
import 'dart:math';

import 'package:flutter/material.dart';

class ColorManager {

  static Color primary50 = HexColor.fromHex("#E0FFFC");
  static Color primary100 = HexColor.fromHex("#C2FFFA");
  static Color primary200 = HexColor.fromHex("#85FFF5");
  static Color primary300 = HexColor.fromHex("#47FFF0");
  static Color primary400 = HexColor.fromHex("#0AFFEB");
  static Color primary500 = HexColor.fromHex("#00CCBB");
  static Color primary600 = HexColor.fromHex("#00A396");
  static Color primary700 = HexColor.fromHex("#007A70");
  static Color primary800 = HexColor.fromHex("#00524B");
  static Color primary900 = HexColor.fromHex("#002925");


  static Color gray50 = HexColor.fromHex("#F9FAFB");
  static Color gray100 = HexColor.fromHex("#F3F4F6");
  static Color gray200 = HexColor.fromHex("#E5E7EB");
  static Color gray300 = HexColor.fromHex("#D1D5DB");
  static Color gray400 = HexColor.fromHex("#9CA3AF");
  static Color gray500 = HexColor.fromHex("#6B7280");
  static Color gray600 = HexColor.fromHex("#4B5563");
  static Color gray700 = HexColor.fromHex("#374151");
  static Color gray800 = HexColor.fromHex("#1F2937");
  static Color gray900 = HexColor.fromHex("#111827");

  ///red
  static Color primaryRed = HexColor.fromHex("#DC2626");
  static Color redPending = HexColor.fromHex("#FDE3E3");
  static Color redBorder = HexColor.fromHex("#FAC7C7");
  static Color red500 = HexColor.fromHex("#EF4444");//#EF4444

///black
  static Color black100 = HexColor.fromHex("#F8F8F9");
  static Color black300 = HexColor.fromHex("#9B9B9B");
  static Color black700 = HexColor.fromHex("#2C3039");
  static Color black800 = HexColor.fromHex("#282C3F");


  ///yellow
  static Color yellowPending = HexColor.fromHex("#F29339");


  ///white
  static Color whiteBorder = HexColor.fromHex('#F8F8F9');


  ///green
  static Color green = HexColor.fromHex("#0A8C79");


  ///previous colors
  static Color brandColor = HexColor.fromHex("#F12679");
  static Color deepBlack = HexColor.fromHex("#172739");
  static Color smallTextBlack = HexColor.fromHex("#393F4F");



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