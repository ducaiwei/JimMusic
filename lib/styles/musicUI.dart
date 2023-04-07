import 'package:flutter/material.dart';

abstract class MusicUI {
  static Color colorF5F6FA = const Color(0xfff5f6fa);
  static Color color333 = const Color(0xff333333);
  static Color colorGreen = const Color(0xff676745);
  static Color colorWhite = const Color(0xffc5c4b2);
  static Color colorRgbaWhite = const Color.fromRGBO(255, 255, 255, .5);
  static Color colorShallowRed = const Color(0xff441e1d);
  static Color colorDeepRed = const Color(0xffea3838);
  static Color flutterWhite = Colors.white;
  static TextStyle musicTextStyle = const TextStyle(
    color: Colors.white
  );
  static Color blackColor = Colors.black;

  static paddingOnly(EdgeInsets insets) {
    return Padding(padding: insets);
  }
  static boxInputDecoration(String label) {
    return InputDecoration(
      hintText: label,
    );
  }
  static const lightSwatch = MaterialColor(0xFFdd4237, {
    900: Color(0xFFae2a20),
    800: Color(0xFFbe332a),
    700: Color(0xFFcb3931),
    600: Color(0xFFdd4237),
    500: Color(0xFFec4b38),
    400: Color(0xFFe85951),
    300: Color(0xFFdf7674),
    200: Color(0xFFea9c9a),
    100: Color(0xFFfcced2),
    50: Color(0xFFfeebee),
  });
  static const double kToolbarHeight = 56.0;
}