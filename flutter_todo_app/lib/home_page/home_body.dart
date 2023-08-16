import 'package:flutter/material.dart';
import 'package:flutter_todo_app/database.dart';
import 'package:flutter_todo_app/note/note.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../main.dart';
import 'home_page.dart';

class HomeBody extends StatelessWidget {
  HomeBody({super.key});
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: () {
        Provider.of<BodyUpdateProvider>(context, listen: false).refreshBody();
        _refreshController.refreshCompleted();
      },
      child: Consumer<BodyUpdateProvider>(
        builder: (_, bodyUpdate, __) => ListView(
          padding: const EdgeInsets.all(5),
          children: <Widget>[
            if (notesList.isNotEmpty) ...[
              for (var note in notesList)
                NoteWidget(
                  note: note,
                  onBackSavePressed: () {
                    DataDB.update(note: note).then((_) {
                      bodyUpdate.refreshBody();
                    });
                  },
                )
            ] else ...[
              Container(
                alignment: AlignmentGeometry.lerp(
                    Alignment.center, Alignment.center, 0),
                child: Text(
                  "Add your first note",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).hintColor),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key,
    required this.note,
    required this.onBackSavePressed,
  });
  final NoteModel note;
  final VoidCallback onBackSavePressed;

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteLongPressedProvider>(
      builder: (_, value, __) => value.noteLongPressed
          ? NoteAfterLongPress(
              note: note,
              value: value,
            )
          : Column(children: [
              SizedBox(
                height: 40,
                child: ElevatedButton(
                    onLongPress: () {
                      print('You long pressed Note button.');
                      value.notesEditList.add(note);
                      Provider.of<NoteLongPressedProvider>(context,
                              listen: false)
                          .onNoteLongPressed();
                    },
                    onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Note(
                                      id: note.id,
                                      title: note.titleController,
                                      content: note.contentController)))
                          .then((_) => onBackSavePressed());
                    },
                    child: Row(children: [
                      Text(note.titleController.text,
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyMedium!.color,
                              fontSize: 18)),
                    ])),
              ),
              const SizedBox(height: 5)
            ]),
    );
  }
}

class NoteAfterLongPress extends StatelessWidget {
  const NoteAfterLongPress({
    super.key,
    required this.note,
    required this.value,
  });
  final NoteModel note;
  final NoteLongPressedProvider value;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 40,
        child: ElevatedButton(
          onPressed: () => value.addToEditList(note),
          style: value.notesEditList.contains(note)
              ? ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.tertiary)
              : null,
          child: Row(children: [
            Text(note.titleController.text,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                    fontSize: 18)),
          ]),
        ),
      ),
      const SizedBox(height: 5)
    ]);
  }
}
