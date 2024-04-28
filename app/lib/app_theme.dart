import 'package:flutter/material.dart';
import 'dart:math';

class AppTheme {
  static int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  static int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  static Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);

  static ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xffe51449),
    primarySwatch: MaterialColor(const Color(0xffe51449).value, {
      50: tintColor(const Color(0xffe51449), 0.9),
      100: tintColor(const Color(0xffe51449), 0.8),
      200: tintColor(const Color(0xffe51449), 0.6),
      300: tintColor(const Color(0xffe51449), 0.4),
      400: tintColor(const Color(0xffe51449), 0.2),
      500: const Color(0xffe51449),
      600: shadeColor(const Color(0xffe51449), 0.1),
      700: shadeColor(const Color(0xffe51449), 0.2),
      800: shadeColor(const Color(0xffe51449), 0.3),
      900: shadeColor(const Color(0xffe51449), 0.4),
    }),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff1a1b2c),
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    scaffoldBackgroundColor: const Color(0xff0a0f1d),
    brightness: Brightness.dark,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color(0xffe51449),
      focusColor: const Color(0xffe51449).withOpacity(0.8),
      splashColor: const Color(0xffe51449).withOpacity(0.6),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff1a1b2c),
      elevation: 0,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
