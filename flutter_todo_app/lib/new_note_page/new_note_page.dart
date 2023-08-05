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
          titleSpacing: 0,
          title: Row(children: [
            IconButton(
              iconSize: 20,
              tooltip: 'back & save',
              icon: const Icon(Icons.arrow_back),
              onPressed: () async {
                if (titleController.text.trim().isNotEmpty ||
                    contentController.text.trim().isNotEmpty) {
                  if (titleController.text.trim().isEmpty) {
                    titleController.text = contentController.text;
                    //     .trim()
                    //     .replaceAll(RegExp(r'\n'), ' ').split(' ');
                    titleController.text.split("\n").removeWhere(
                        (item) => item.length == 1 && item.contains(" "));

                    print("Text:  ${contentController.text}");
                  }
                  NoteModel note = NoteModel(
                    title: titleController.text,
                    content: contentController.text,
                  );
                  await DataDB.addNote(note: note).then((value) {
                    Navigator.pop(context, true);
                  });
                } else {
                  Navigator.pop(context, false);
                }
              },
            ),
            Expanded(child: NewNoteAppBar(controllerTitle: titleController)),
          ])),
      // ----------------------Center-------------------------------
      body: NewNoteBody(controller: contentController),
      // ----------------------BOTTOM--------------------------------
    );
  }
}
