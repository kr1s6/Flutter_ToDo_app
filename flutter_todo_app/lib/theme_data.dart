import 'package:flutter/material.dart';

class CustomTheme {
  ThemeData themedata = ThemeData(
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
            side: BorderSide(width: 1, color: Colors.green[900]!),
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 73, 196, 93),
            shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)))),
      ));
}
