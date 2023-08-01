import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'database.dart';
import 'home_page/home_page.dart';
import 'new_note_page/new_note_page.dart';
import 'theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataDB.initDb();
  await DataDB.getNotes();

  print("Length:  ${notesList.length}");
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
  void notification() {
    notifyListeners();
  }
}

// -----------------------------------------------------------------------------------------
List notesList = <NoteModel>[];

class DataDB {
  static initDb() async {
    await DatabaseHelper.instance.database
        .whenComplete(() => print("Complete initDB"));
  }

  static getNotes() async {
    await DatabaseHelper.instance.getAllNotes().then((value) {
      notesList = value;
    });

    print("notesList values:");
    for (var x in notesList) {
      print(
          "id: ${x.id}, title: ${x.titleController.text}, content: ${x.contentController.text}");
    }
  }

  static addNote(titleController, contentController) async {
    NoteModel note = NoteModel(
      title: titleController.text,
      content: contentController.text,
    );
    await DatabaseHelper.instance.insert(note: note);
    // ------------------------------------
    DatabaseHelper.instance.getAllNotes().then((value) {
      print("length: ${value.length}");
      for (var x in value) {
        print(
            "id: ${x.id}, title: ${x.titleController.text}, content: ${x.contentController.text}");
      }
    });
  }

  static delete(
      {required NoteModel note, required BuildContext context}) async {
    DatabaseHelper.instance.delete(note.id!).then((value) {
      notesList.remove(note);
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    });
  }
}
