import 'package:flutter/material.dart';
import 'package:flutter_todo_app/main.dart';

import '../new_note_page/new_note_page.dart';
import 'home_body.dart';
import 'home_bottom_appbar.dart';

class HomePageController {
  late void Function() updateBodyState;
  // TODO fix.
}

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.theme});
  final ThemeNotifier theme;
  static const String routeName = '/home';

  final HomePageController updateController = HomePageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: HomeBody(updateController: updateController),
      // ----------------------BOTTOM--------------------------------
      bottomNavigationBar: HomeBottomAppBar(theme: theme),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.pushNamed(context, NewNotePage.routeName).then((value) {
            if (value == true) {
              updateController.updateBodyState();
            }
          });
        },
        child: const Icon(Icons.create),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
