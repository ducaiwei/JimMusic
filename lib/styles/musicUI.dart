import 'package:flutter/material.dart';

abstract class MusicUI {
  static Color colorF5F6FA = const Color(0xfff5f6fa);
  static Color color333 = const Color(0xff333333);
  static Color colorGreen = const Color(0xff676745);
  static Color colorWhite = const Color(0xffc5c4b2);
  static Color colorRgbaWhite = const Color.fromRGBO(255, 255, 255, .5);


  static paddingOnly(EdgeInsets insets) {
    return Padding(padding: insets);
  }
  static boxInputDecoration(String label) {
    return InputDecoration(
      hintText: label,
    );
  }
}