import 'package:flutter/material.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:flutter_todo_app/note.dart';
import 'package:provider/provider.dart';

import '../home_page/home_page.dart';
import 'new_note_appbar.dart';
import 'new_note_body.dart';
import 'new_note_bottom_appbar.dart';

class NewNotePage extends StatefulWidget {
  const NewNotePage({super.key});
  static const String routeName = '/home/new_note';

  @override
  State<NewNotePage> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      // ----------------------TOP--------------------------------
      appBar: AppBar(
        title: NewNoteAppBar(controller: titleController),
      ),
      // ----------------------Center-------------------------------
      body: NewNoteBody(controller: contentController),
      // ----------------------BOTTOM--------------------------------
      bottomNavigationBar: const NewNoteBottomAppBar(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'save',
        onPressed: () {
          appState.notesList
              .add(Note(title: titleController, content: contentController));

          Navigator.pushReplacementNamed(context, HomePage.routeName);
        },
        child: const Icon(Icons.save),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
