import 'package:flutter/material.dart';

import '../../database/note_model.dart';
import '../controller/editing_notifier.dart';

class NoteWidgetEditing extends StatelessWidget {
  const NoteWidgetEditing({
    super.key,
    required this.note,
    required this.value,
  });
  final NoteModel note;
  final EditingNotifier value;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 40,
        child: ElevatedButton(
          onPressed: () => value.addToEditList(note),
          style: notesEditList.contains(note)
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
