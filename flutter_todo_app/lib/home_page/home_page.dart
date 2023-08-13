import 'package:flutter/material.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:provider/provider.dart';

import '../new_note_page/new_note_page.dart';
import 'home_body.dart';
import 'home_bottom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.theme});
  final ThemeNotifier theme;
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BodyUpdate>(
      create: (context) => BodyUpdate(),
      builder: (context, child) => Scaffold(
        // ----------------------TOP--------------------------------
        appBar: AppBar(
          toolbarHeight: 50,
          title: Text(
            'Notes',
            style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
          ),
        ),
        // ----------------------Center-------------------------------
        body: HomeBody(),
        // ----------------------BOTTOM--------------------------------
        bottomNavigationBar: HomeBottomAppBar(theme: theme),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.pushNamed(context, NewNotePage.routeName).then((value) {
              if (value == true) {
                Provider.of<BodyUpdate>(context, listen: false).refreshBody();
              }
            });
          },
          child: const Icon(Icons.create),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class BodyUpdate extends ChangeNotifier {
  void refreshBody() {
    notifyListeners();
  }
}
