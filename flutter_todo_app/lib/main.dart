import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'database.dart';
import 'home_page/home_page.dart';
import 'new_note_page/new_note_page.dart';
import 'theme_data.dart';

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
        theme: CustomTheme().themedata,
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
  static var notesList = <NoteModel>[];

  void addNote(titleController, contentController) async {
    NoteModel note = NoteModel(
      title: titleController.text,
      content: contentController.text,
    );
    await DatabaseHelper.instance.insert(note: note);
    notifyListeners();
    print("IN addNote");
  }

  // void removeNote(note) {
  //   notesList.remove(note);
  //   notifyListeners();
  // }

  void notification() {
    notifyListeners();
  }
}
