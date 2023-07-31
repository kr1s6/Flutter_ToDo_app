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
        titleSpacing: 10,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              alignment: Alignment.centerLeft,
              iconSize: 20,
              padding: const EdgeInsets.all(0),
              tooltip: 'back & save',
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              width: 0,
            ),
            Expanded(child: NoteAppBar(controllerTitle: title)),
          ],
        ),
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
    return const BottomAppBar(
      notchMargin: 4,
      clipBehavior: Clip.antiAlias,
    );
  }
}
