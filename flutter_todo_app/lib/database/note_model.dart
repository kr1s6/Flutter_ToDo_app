import 'package:flutter/material.dart';

class NoteModel {
  final int? id;
  final TextEditingController titleController;
  final TextEditingController contentController;

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
