import 'package:flutter/material.dart';

import '../../database/data_db.dart';
import '../../database/note_model.dart';

List notesEditList = <NoteModel>[];

class EditingNotifier extends ChangeNotifier {
  void addToEditList(NoteModel note) {
    if (notesEditList.contains(note)) {
      notesEditList.remove(note);
      print("note removed from notesEditList");
    } else {
      notesEditList.add(note);
      print("note added to notesEditList");
    }
    notifyListeners();
  }

  void deleteNotes(context) async {
    if (notesEditList.isNotEmpty) {
      for (var note in notesEditList) {
        await DataDB.delete(note: note, context: context).then((_) {
          print("Deleted note");
          notifyListeners();
          // ? delete this notifyListeners() if you want better performace
        });
      }
      Navigator.pop(context);
    }
  }
}
