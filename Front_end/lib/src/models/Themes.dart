// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Themes {
  static final colorScheme = ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color(0xFF0C89DA),
  );

  static final darkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 77, 181, 160),
    background: const Color.fromARGB(255, 52, 52, 52),
  );

  static ThemeData lightTheme = ThemeData().copyWith(
    colorScheme: colorScheme,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.blueGrey.withOpacity(.4),
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    ),
    textTheme: const TextTheme().copyWith(
      titleLarge: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleMedium: const TextStyle(
        fontWeight: FontWeight.w900,
        color: Colors.black87,
      ),
      titleSmall: const TextStyle(
        fontWeight: FontWeight.w800,
        color: Colors.black54,
      ),
      bodySmall: const TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.black54,
      ),
      bodyMedium: const TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
      bodyLarge: const TextStyle(
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      labelSmall: const TextStyle(
        fontWeight: FontWeight.w200,
        color: Colors.black54,
      ),
      labelMedium: const TextStyle(
        fontWeight: FontWeight.w300,
        color: Colors.black87,
      ),
      labelLarge: const TextStyle(
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData().copyWith(
    colorScheme: darkColorScheme,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.blueGrey.withOpacity(.4),
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    ),
    textTheme: const TextTheme().copyWith(
      titleLarge: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleMedium: const TextStyle(
        fontWeight: FontWeight.w900,
        color: Colors.white70,
      ),
      titleSmall: const TextStyle(
        fontWeight: FontWeight.w800,
        color: Colors.white54,
      ),
      bodySmall: const TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.white54,
      ),
      bodyMedium: const TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.white70,
      ),
      bodyLarge: const TextStyle(
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      labelSmall: const TextStyle(
        fontWeight: FontWeight.w200,
        color: Colors.white54,
      ),
      labelMedium: const TextStyle(
        fontWeight: FontWeight.w300,
        color: Colors.white70,
      ),
      labelLarge: const TextStyle(
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    ),
  );

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
