import 'package:flutter/material.dart';
import 'package:flutter_todo_app/main.dart';

import '../database.dart';
import 'new_note_appbar.dart';
import 'new_note_body.dart';

class NewNotePage extends StatefulWidget {
  const NewNotePage({super.key});
  static const String routeName = '/home/new_note';

  @override
  State<NewNotePage> createState() => NewNotePageState();
}

class NewNotePageState extends State<NewNotePage> {
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
        onPressed: () async {
          if (titleController.text.isNotEmpty ||
              contentController.text.isNotEmpty) {
            NoteModel note = NoteModel(
              title: titleController.text,
              content: contentController.text,
            );
            print("Before addNote");
            await DataDB.addNote(note: note).then((value) {
              print("Added to noteList!");
              Navigator.pop(context);
            });
          } else {
            //TODO add boolean to Navigato.pop(context)
            Navigator.pop(context);
          }
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
