import 'package:flutter/material.dart';

import '../../database/data_db.dart';
import '../../database/note_model.dart';

class CreateNoteNotifier extends ChangeNotifier {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  void backAndSave(context) {
    if (titleController.text.trim().isNotEmpty ||
        contentController.text.trim().isNotEmpty) {
      ifEmptyTitle();
      NoteModel note = NoteModel(
        title: titleController.text,
        content: contentController.text,
      );
      DataDB.addNote(note: note).then((value) {
        print("Back and Save");
        Navigator.pop(context, true);
      });
    } else {
      Navigator.pop(context, false);
    }
  }

  void ifEmptyTitle() {
    // If title is empty then title is created out of content.
    if (titleController.text.trim().isEmpty) {
      titleController.text = contentController.text;
      var list = titleController.text.split(RegExp(r'[\n ]'));
      list.removeWhere((item) => item.isEmpty);
      // -----------------------------------
      if (list.length >= 3) {
        list = list.sublist(0, 3);
        titleController.text = list.join(' ');
      } else {
        titleController.text = list.join(' ');
      }
      // -----------------------------------
      if (titleController.text.length > 25) {
        titleController.text = titleController.text.substring(0, 25);
      }
    } else {
      print("Title isn't empty");
    }
  }
}
