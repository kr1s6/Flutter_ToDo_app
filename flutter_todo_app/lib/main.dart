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
        home: HomePage(),
        routes: {
          HomePage.routeName: (context) => HomePage(),
          NewNotePage.routeName: (context) => const NewNotePage(),
        },
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  // var appState = context.watch<MyAppState>();
  void notification() {
    notifyListeners();
  }
}


// -----------------------------------------------------------------------------------------
List notesList = <NoteModel>[];

class DataDB {
  static Future<void> initDb() async {
    await DatabaseHelper.instance.database
        .whenComplete(() => print("Complete initDB"));
  }

  static Future<void> getNotes() async {
    await DatabaseHelper.instance.getAllNotes().then((value) {
      notesList = value;
    });

    print("notesList values:");
    for (var x in notesList) {
      print("id: ${x.id}, title: ${x.titleController.text}");
    }
  }

  static Future<void> addNote({required NoteModel note}) async {
    await DatabaseHelper.instance.insert(note: note).then((value) {
      notesList.add(value);
      print("addNote");
    });
    // ------------------------------------
    await DatabaseHelper.instance.getAllNotes().then((value) {
      for (var x in value) {
        print("id: ${x.id}, title: ${x.titleController.text}");
      }
    });
  }

  static Future<void> delete(
      {required NoteModel note, required BuildContext context}) async {
    await DatabaseHelper.instance.delete(note.id!).then((_) {
      notesList.remove(note);
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    });
  }
}
