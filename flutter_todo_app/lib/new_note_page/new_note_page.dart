import 'package:flutter/material.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:provider/provider.dart';

import 'new_note_appbar.dart';
import 'new_note_body.dart';

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
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      // ----------------------TOP--------------------------------
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 10,
        title: NewNoteAppBar(controller: titleController),
      ),
      // ----------------------Center-------------------------------
      body: NewNoteBody(controller: contentController),
      // ----------------------BOTTOM--------------------------------
      bottomNavigationBar: const BottomAppBar(
        notchMargin: 4,
        clipBehavior: Clip.antiAlias,
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'save',
        onPressed: () {
          if (titleController.text.isNotEmpty ||
              contentController.text.isNotEmpty) {
            DataDB.addNote(titleController, contentController);
            appState.notification();
          }
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.done_rounded,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
