import 'package:flutter/material.dart';

abstract class MusicUI {
  static Color colorF5F6FA = Color(0xfff5f6fa);
  static Color color333 = Color(0xff333333);

  static paddingOnly(EdgeInsets insets) {
    return Padding(padding: insets);
  }
  static boxInputDecoration(String label) {
    return InputDecoration(
      hintText: label,
    );
  }
}