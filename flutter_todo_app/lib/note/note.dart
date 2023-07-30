import 'package:flutter/material.dart';

import 'note_appbar.dart';
import 'note_body.dart';

class Note extends StatelessWidget {
  const Note({super.key, required this.title, required this.content});
  final TextEditingController title;
  final TextEditingController content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      // ----------------------TOP--------------------------------
      appBar: AppBar(
        title: NoteAppBar(controllerTitle: title),
      ),
      // ----------------------Center-------------------------------
      body: NoteBody(controllerContent: content),
      // ----------------------BOTTOM--------------------------------
      bottomNavigationBar: const NoteBottomAppBar(),
    );
  }
}

class NoteBottomAppBar extends StatelessWidget {
  const NoteBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 4,
      clipBehavior: Clip.antiAlias,
      // -------------------------------------------------
      child: IconTheme(
        data: const IconThemeData(color: Colors.black),
        child: Row(
          children: <Widget>[
            IconButton(
              padding: const EdgeInsets.all(0),
              tooltip: 'back',
              icon: const Icon(Icons.chevron_left_rounded),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
