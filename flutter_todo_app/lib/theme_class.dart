import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    // TODO left here only color data
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green,
    ),
    appBarTheme: const AppBarTheme(
      toolbarHeight: 50,
      backgroundColor: Color.fromARGB(255, 72, 175, 90),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color.fromARGB(255, 76, 196, 80),
      shape: CircleBorder(),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      height: 40,
      padding: EdgeInsets.all(5),
      shape: CircularNotchedRectangle(),
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
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      toolbarHeight: 50,
      backgroundColor: Color.fromARGB(255, 72, 175, 90),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color.fromARGB(255, 76, 196, 80),
      shape: CircleBorder(),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      height: 40,
      padding: EdgeInsets.all(5),
      shape: CircularNotchedRectangle(),
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
  );
}
