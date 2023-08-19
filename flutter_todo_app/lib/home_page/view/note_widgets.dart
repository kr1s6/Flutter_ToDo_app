import 'package:flutter/material.dart';

import '../../database/note_model.dart';
import '../../note_page/view/note_page.dart';
import '../controller/home_notifier.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key,
    required this.value,
    required this.note,
    required this.onBackSavePressed,
  });
  final HomeNotifier value;
  final NoteModel note;
  final VoidCallback onBackSavePressed;

  @override
  Widget build(BuildContext context) {
    return value.noteLongPressed
        ? NoteWidgetEditing(
            note: note,
            value: value,
          )
        : Column(children: [
            SizedBox(
              height: 40,
              child: ElevatedButton(
                  onLongPress: () => value.onNoteLongPressed(note),
                  onPressed: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Note(
                                    id: note.id,
                                    title: note.titleController,
                                    content: note.contentController)))
                        .then((_) => onBackSavePressed());
                  },
                  child: Row(children: [
                    Text(note.titleController.text,
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color,
                            fontSize: 18)),
                  ])),
            ),
            const SizedBox(height: 5)
          ]);
  }
}

class NoteWidgetEditing extends StatelessWidget {
  const NoteWidgetEditing({
    super.key,
    required this.note,
    required this.value,
  });
  final NoteModel note;
  final HomeNotifier value;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 40,
        child: ElevatedButton(
          onPressed: () => value.addToEditList(note),
          style: value.notesEditList.contains(note)
              ? ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.tertiary)
              : null,
          child: Row(children: [
            Text(note.titleController.text,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                    fontSize: 18)),
          ]),
        ),
      ),
      const SizedBox(height: 5)
    ]);
  }
}
