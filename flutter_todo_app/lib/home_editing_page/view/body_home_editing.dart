import 'package:flutter/material.dart';

import '../../database/data_db.dart';
import '../controller/editing_notifier.dart';
import 'note_widget_editing.dart';

class HomeEditingBody extends StatelessWidget {
  const HomeEditingBody({super.key, required this.value});
  final EditingNotifier value;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(5),
      children: <Widget>[
        if (notesList.isNotEmpty) ...[
          for (var note in notesList)
            NoteWidgetEditing(
              value: value,
              note: note,
            )
        ]
      ],
    );
  }
}
