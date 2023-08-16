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

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, theme, __) {
          return MaterialApp(
            title: 'Notes',
            themeMode: theme.mode,
            theme: ThemeClass.lightTheme,
            darkTheme: ThemeClass.darkTheme,
            home: HomePage(theme: theme),
            routes: {
              HomePage.routeName: (context) => HomePage(theme: theme),
              NewNotePage.routeName: (context) => NewNotePage(),
            },
          );
        },
      ),
    );
  }
}

// var themeState = context.watch<ThemeNotifier>();
class ThemeNotifier extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.light;
  ThemeMode get mode => _mode;

  IconData _themeIcon = Icons.nightlight;
  String _themeString = "Dark mode";
  get themeIcon => _themeIcon;
  get themeString => _themeString;

  final _theme = DarkThemeSharedPreference();

  ThemeNotifier() {
    _theme.getDarkTheme().then((value) {
      print('value read from storage: ${value.toString()}');
      var isDarkTheme = value ?? 'light';
      if (isDarkTheme) {
        _themeIcon = Icons.wb_sunny;
        _themeString = "Light mode";
        _mode = ThemeMode.dark;
        print("Dark theme");
      } else {
        _themeIcon = Icons.nightlight;
        _themeString = "Dark mode";
        _mode = ThemeMode.light;
        print("Light theme");
      }
      notifyListeners();
    });
  }

  void changeThemeMode() {
    if (_mode == ThemeMode.light) {
      _themeIcon = Icons.wb_sunny;
      _themeString = "Light mode";
      _mode = ThemeMode.dark;
      _theme.setDarkTheme(true);
      print("set dark theme");
    } else {
      _themeIcon = Icons.nightlight;
      _themeString = "Dark mode";
      _mode = ThemeMode.light;
      _theme.setDarkTheme(false);
      print("set light theme");
    }
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
    print("DataBase delete");
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
