import 'package:flutter/material.dart';

import '../home_page/home_page.dart';
import 'new_note_appbar.dart';
import 'new_note_body.dart';
import 'new_note_bottom_appbar.dart';

class NewNotePage extends StatelessWidget {
  const NewNotePage({super.key});
  static const String routeName = '/home/new_note';

  @override
  Widget build(BuildContext context) {
    // var appState = context.watch<MyAppState>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      // ----------------------TOP--------------------------------
      appBar: AppBar(
        title: const NewNotePageAppBar(),
      ),
      // ----------------------Center-------------------------------
      body: const NewNoteBody(),
      // ----------------------BOTTOM--------------------------------
      bottomNavigationBar: const NewNoteBottomAppBar(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'save',
        onPressed: () {
          Navigator.pushReplacementNamed(context, HomePage.routeName);
        },
        child: const Icon(Icons.save),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
