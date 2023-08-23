import 'package:flutter/material.dart';

import 'title_note.dart';
import 'body_note.dart';

class Note extends StatelessWidget {
  const Note(
      {super.key,
      required this.id,
      required this.title,
      required this.content});
  final int? id;
  final TextEditingController title;
  final TextEditingController content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ----------------------TOP--------------------------------
      appBar: AppBar(
          toolbarHeight: 50,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: Row(children: [
            IconButton(
              iconSize: 20,
              tooltip: 'back & save',
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            Expanded(child: NoteAppBar(controllerTitle: title)),
          ])),
      // ----------------------Center-------------------------------
      body: NoteBody(controllerContent: content),
    );
  }
}
