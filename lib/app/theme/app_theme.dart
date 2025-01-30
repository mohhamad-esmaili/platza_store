import 'package:flutter/material.dart';
import 'package:platza_store/app/gen/fonts.gen.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: FontFamily.imprima,
    scaffoldBackgroundColor: const Color(0xffF5F5F5),
    primaryColor: Color(0xffFF7A00),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.centerLeft,
        side: WidgetStatePropertyAll(
          BorderSide(
            color: Color(0xffFF7A00),
            width: 1,
          ),
        ),
        textStyle: WidgetStatePropertyAll(
          TextStyle(color: Colors.black),
        ),
        iconColor: WidgetStatePropertyAll(
          Colors.black,
        ),
        overlayColor: WidgetStatePropertyAll(
          Color(0xffFF7A00).withOpacity(0.5),
        ),
      ),
    ),
  );
}
