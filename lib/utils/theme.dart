import 'package:blogapp/utils/text_theme.dart';
import 'package:flutter/material.dart';

class BAppTheme {
  BAppTheme._();

  static ThemeData lightTheme = ThemeData(
    fontFamily: "Poppins",
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Color(0xFFF4F4F4),
      secondary: Colors.blue,
      surface: Color(0xFFF4F4F4),
    ),
    scaffoldBackgroundColor: Color.fromRGBO(244, 244, 244, 1),

    textTheme: BTextTheme.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Color(0xFF1C1C1C),
      secondary: Colors.blue,
      surface: Color(0xFF1C1C1C),
    ),
    scaffoldBackgroundColor: Color.fromRGBO(28, 28, 28, 1),

    textTheme: BTextTheme.darkTextTheme,
  );
}
