import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NoteModel {
  int? id;
  TextEditingController titleController;
  TextEditingController contentController;

  NoteModel({
    this.id,
    required String title,
    required String content,
  })  : titleController = TextEditingController(text: title),
        contentController = TextEditingController(text: content);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': titleController.text,
      'content': contentController.text,
    };
  }

  factory NoteModel.fromJson(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'],
      title: map['title'],
      content: map['content'],
    );
  }
}

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  DatabaseHelper._init();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filePath);
    print("In _initDB");

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
          CREATE TABLE notes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title VARCHAR(30),
            content VARCHAR(1000)
          )''');
    });
  }

  Future<void> insert({required NoteModel note}) async {
    try {
      final db = await database;
      db.insert('notes', note.toMap());
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<NoteModel>> getAllNotes() async {
    final db = await instance.database;
    final result = await db.query('notes');

    return result.map((json) => NoteModel.fromJson(json)).toList();
  }

  Future<void> delete(int id) async {
    try {
      final db = await instance.database;
      await db.delete("notes", where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      print(e.toString());
    }
  }
}
