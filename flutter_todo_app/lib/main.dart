import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'database.dart';
import 'home_page/home_page.dart';
import 'new_note_page/new_note_page.dart';
import 'theme_class.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataDB.initDb();
  await DataDB.getNotes();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeNotifier>(
      create: (context) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, theme, __) {
          return MaterialApp(
            title: 'Notes',
            themeMode: theme.mode,
            theme: ThemeClass.lightTheme,
            darkTheme: ThemeClass.darkTheme,
            home: HomePage(),
            routes: {
              HomePage.routeName: (context) => HomePage(),
              NewNotePage.routeName: (context) => const NewNotePage(),
            },
          );
        },
      ),
    );
  }
}

class ThemeNotifier extends ChangeNotifier {
  // var appState = context.watch<ChangeProvider>();
  ThemeMode _mode;
  ThemeMode get mode => _mode;
  ThemeNotifier({ThemeMode mode = ThemeMode.dark}) : _mode = mode;

  void toggleMode() {
    _mode = (_mode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
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
  }

  static Future<void> addNote({required NoteModel note}) async {
    await DatabaseHelper.instance.insert(note: note).then((value) {
      notesList.add(value);
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

  static Future<void> update({required NoteModel note}) async {
    await DatabaseHelper.instance.update(note);
  }
}
