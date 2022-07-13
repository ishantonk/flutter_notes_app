import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true, // Use Material Design 3.0.0.
      canvasColor: Colors.white,
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true, // Use Material Design 3.0.0.
      primarySwatch: Colors.lightGreen,
      brightness: Brightness.dark,
    );
  }

  // colors
  static const Color swatchColor1 = Color(0xFFE8EBED);
  static const Color swatchColor2 = Color(0xFFC6C7CE);
  static const Color swatchColor3 = Color(0xFF010101);
  static const Color swatchColor4 = Color(0xFF626362);
  static const Color swatchColor5 = Color(0xFF6996EA);
  static const Color swatchColor6 = Color(0xFF8E7085);

  // text colors
  static const Color textColor1 = Color(0xFF010101);
  static const Color textColor2 = Color(0xFF626362);

  // text styles
  static const TextStyle headline1TextStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: textColor1,
  );
  static const TextStyle headline2TextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: textColor2,
  );
  static const TextStyle headline3TextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: textColor2,
  );
  static const TextStyle headline4TextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textColor2,
  );
  static const TextStyle textStyle1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: textColor1,
  );
  static const TextStyle textStyle2 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textColor2,
  );
}
