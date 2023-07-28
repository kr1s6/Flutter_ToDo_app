import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page/home_page.dart';
import 'new_note_page/new_note_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'ToDo App',
        theme: ThemeData(
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
        ),
        // home: const NotesPage(),
        home: const HomePage(),
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          NewNotePage.routeName: (context) => const NewNotePage(),
        },
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var notesList = <Container>[];
}
