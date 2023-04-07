
import 'package:flutter/material.dart';

extension snackBarExtension on BuildContext {
  showSnack(String content) {
    final snackBar = SnackBar(
      content: Text(content),
      action: SnackBarAction(
        label: '取消',
        onPressed: () {
        },
      ),
    );
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}