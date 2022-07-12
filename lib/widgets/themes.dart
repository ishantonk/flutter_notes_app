import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.lightGreen,
      brightness: Brightness.light,
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.lightGreen,
      brightness: Brightness.dark,
    );
  }
}
