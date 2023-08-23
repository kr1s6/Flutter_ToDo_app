import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'note_model.dart';

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

  Future<NoteModel> insert({required NoteModel note}) async {
    try {
      final db = await database;
      final id = await db.insert('notes', note.toMap());
      final result = await db.query("notes", where: "id = ?", whereArgs: [id]);
      return NoteModel.fromJson(result.first);
    } catch (e) {
      print(e.toString());
      rethrow;
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

  Future<void> update(NoteModel note) async {
    try {
      final db = await instance.database;
      db.update("notes", note.toMap(), where: 'id = ?', whereArgs: [note.id]);
    } catch (e) {
      print(e.toString());
    }
  }
}
