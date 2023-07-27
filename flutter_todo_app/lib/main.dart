import 'package:flutter/material.dart';
import 'package:flutter_todo_app/create_note.dart';
import 'package:flutter_todo_app/notes_page.dart';
import 'package:provider/provider.dart';

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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          appBarTheme: AppBarTheme(
            toolbarHeight: 50,
            backgroundColor: Colors.green[700]!,
          ),
        ),
        home: const MainPage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var selectedPage = 0;
  void changePage() {
    if (selectedPage == 0) {
      selectedPage = 1;
    } else {
      selectedPage = 0;
    }
    notifyListeners();
  }

  var notesList = <Container>[];
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    var selectedPage = context.watch<MyAppState>().selectedPage;

    Widget page;
    switch (selectedPage) {
      case 0:
        page = NotesPage();
        break;
      case 1:
        page = NewNotePage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedPage');
    }
    return Container(
      child: page,
    );
  }
}
