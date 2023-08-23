import 'package:flutter/material.dart';

import 'database_helper.dart';
import 'note_model.dart';

List notesList = <NoteModel>[];

class DataDB {
  static Future<void> initDb() async {
    await DatabaseHelper.instance.database
        .whenComplete(() => print("Complete initDB"));
  }

  static Future<void> getNotes() async {
    await DatabaseHelper.instance.getAllNotes().then((value) {
      notesList = value;
    });
  }

  static Future<void> addNote({required NoteModel note}) async {
    await DatabaseHelper.instance.insert(note: note).then((value) {
      notesList.add(value);
    });
  }

  static Future<void> delete(
      {required NoteModel note, required BuildContext context}) async {
    print("DataBase delete");
    await DatabaseHelper.instance.delete(note.id!).then((_) {
      notesList.remove(note);
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    });
  }

  static Future<void> update({required NoteModel note}) async {
    await DatabaseHelper.instance.update(note);
  }
}
