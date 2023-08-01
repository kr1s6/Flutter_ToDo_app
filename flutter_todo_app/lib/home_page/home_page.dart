import 'package:flutter/material.dart';
import 'package:flutter_todo_app/main.dart';

import '../database.dart';
import '../new_note_page/new_note_page.dart';
import 'home_body.dart';
import 'home_bottom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = '/home';

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    // initDb();
    // getNotes();
    super.initState();
  }

  void initDb() async {
    await DatabaseHelper.instance.database;
  }

  void getNotes() async {
    await DatabaseHelper.instance.getAllNotes().then((value) {
      setState(() {
        notesList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primaryContainer,
      // ----------------------TOP--------------------------------
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      // ----------------------Center-------------------------------
      body: const HomeBody(),
      // ----------------------BOTTOM--------------------------------
      bottomNavigationBar: const HomeBottomAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NewNotePage.routeName);
        },
        child: const Icon(Icons.create),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
