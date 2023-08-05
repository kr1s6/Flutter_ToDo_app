import 'package:flutter/material.dart';

import 'note_appbar.dart';
import 'note_body.dart';

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
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      // ----------------------TOP--------------------------------
      appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: Row(children: [
            IconButton(
              iconSize: 20,
              tooltip: 'back & save',
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Expanded(child: NoteAppBar(controllerTitle: title)),
          ])),
      // ----------------------Center-------------------------------
      body: NoteBody(controllerContent: content),
    );
  }
}
