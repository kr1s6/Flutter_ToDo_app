import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        onPrimary: Colors.black,
        secondary: const Color.fromARGB(255, 213, 230, 209),
        tertiary: const Color.fromARGB(255, 141, 200, 150)),
    scaffoldBackgroundColor: const Color.fromARGB(255, 167, 243, 170),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color: Colors.black),
      backgroundColor: Color.fromARGB(255, 72, 175, 90),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color.fromARGB(255, 76, 196, 80),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Color.fromARGB(255, 72, 175, 90),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 27, 137, 42),
          padding: const EdgeInsetsDirectional.only(start: 10),
          side: const BorderSide(width: 2, color: Color.fromARGB(255, 0, 0, 0)),
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)))),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Color.fromARGB(255, 218, 255, 203),
      ),
    ),
    hintColor: Colors.black.withOpacity(0.5),
    focusColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.black),
    popupMenuTheme:
        const PopupMenuThemeData(color: Color.fromARGB(255, 88, 186, 91)),
  );
// ----------------------------------------------
// -----------------DARK THEME-------------------
// ----------------------------------------------
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.black,
      brightness: Brightness.dark,
      // primary is for cursor
      primary: Colors.amber,
      onPrimary: Colors.white,
      secondary: Colors.black,
      tertiary: const Color.fromARGB(255, 74, 74, 74),
    ),
    hintColor: Colors.white.withOpacity(0.5),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color: Colors.white),
      backgroundColor: Color.fromARGB(255, 33, 33, 33),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color.fromARGB(255, 74, 74, 74),
      foregroundColor: Colors.white,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Color.fromARGB(255, 47, 47, 47),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: const EdgeInsetsDirectional.only(start: 10),
          side: const BorderSide(
            width: 2,
            color: Color.fromARGB(255, 113, 113, 113),
          ),
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)))),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),
    focusColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.white),
    popupMenuTheme: const PopupMenuThemeData(
      color: Color.fromARGB(255, 53, 53, 53),
    ),
  );
}
