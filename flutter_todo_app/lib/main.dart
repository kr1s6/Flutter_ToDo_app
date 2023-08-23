import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'create_note_page/view/create_note_page.dart';
import 'database/data_db.dart';
import 'home_editing_page/view/home_editing_page.dart';
import 'home_page/view/home_page.dart';
import 'search_page/view/search_page.dart';
import 'theme/theme_controller.dart';
import 'theme/themes.dart';

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
              NewNotePage.routeName: (context) => const NewNotePage(),
              HomeEditingPage.routeName: (context) => const HomeEditingPage(),
              SearchPage.routeName: (context) => const SearchPage(),
            },
          );
        },
      ),
    );
  }
}
