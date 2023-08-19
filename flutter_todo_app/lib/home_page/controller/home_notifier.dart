import 'package:flutter/material.dart';

import '../../database/data_db.dart';
import '../../database/note_model.dart';

class HomeNotifier extends ChangeNotifier {
  List notesEditList = <NoteModel>[];

  void refresh() {
    print('REFRESH');
    notifyListeners();
  }

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

  void deleteNotes(context) {
    _noteLongPressed = false;
    if (notesEditList.isNotEmpty) {
      for (var note in notesEditList) {
        DataDB.delete(note: note, context: context).then((_) {
          print("Deleted note");
          notifyListeners();
        });
      }
    }
  }

  bool _noteLongPressed = false;
  bool get noteLongPressed => _noteLongPressed;

  final _centerDocked = FloatingActionButtonLocation.centerDocked;
  final _centerFloat = FloatingActionButtonLocation.centerFloat;
  FloatingActionButtonLocation get floatingActionButtonLocation =>
      _noteLongPressed ? _centerFloat : _centerDocked;

  void onNoteLongPressed(note) {
    print('Long pressed Note.');
    notesEditList.add(note);
    _noteLongPressed = true;
    notifyListeners();
  }
}
