import 'package:flutter/material.dart';

import '../../database/note_model.dart';
import '../../note_page/view/note_page.dart';
import '../controller/home_notifier.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key,
    required this.value,
    required this.note,
  });
  final HomeNotifier value;
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 40,
        child: ElevatedButton(
            onLongPress: () => value.onNoteLongPressed(context, note),
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Note(
                              id: note.id,
                              title: note.titleController,
                              content: note.contentController)))
                  .then((_) => value.onBackSavePressed(note));
            },
            child: Row(children: [
              Text(note.titleController.text,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                      fontSize: 18)),
            ])),
      ),
      const SizedBox(height: 5)
    ]);
  }
}
