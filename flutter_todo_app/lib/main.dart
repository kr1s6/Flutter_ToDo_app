import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/main_page.dart';
import 'package:provider/provider.dart';
import 'package:english_words/english_words.dart';

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
        title: 'TODO App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromRGBO(89, 213, 39, 1)),
        ),
        home: MainPage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  Random random = Random();
  Color bigCardColor = Colors.green[900]!;

  void getNext() {
    current = WordPair.random();
    bigCardColor =
        Colors.primaries[Random().nextInt(Colors.primaries.length)][900]!;
    notifyListeners();
  }

  var favorites = <WordPair>{};

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }

  void removeFavorite(value) {
    favorites.remove(value);
    notifyListeners();
  }
}
