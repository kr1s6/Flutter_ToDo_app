import 'package:flutter/material.dart';
import 'package:flutter_todo_app/database.dart';
import 'package:flutter_todo_app/note/note.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../main.dart';
import 'home_page.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key, required this.updateController});
  final HomePageController updateController;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    widget.updateController.updateBodyState = () {
      setState(() {});
    };
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: () {
        setState(() {});
        _refreshController.refreshCompleted();
      },
      child: ListView(
        padding: const EdgeInsets.all(5),
        children: <Widget>[
          if (notesList.isNotEmpty) ...[
            for (var note in notesList)
              NoteWidget(
                  note: note,
                  onDeletePressed: () {
                    DataDB.delete(note: note, context: context).then((_) {
                      setState(() {});
                    });
                  },
                  onBackSavePressed: () {
                    DataDB.update(note: note).then((_) {
                      setState(() {});
                    });
                  })
          ] else ...[
            Container(
              alignment:
                  AlignmentGeometry.lerp(Alignment.center, Alignment.center, 0),
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
    );
  }
}

class NoteWidget extends StatelessWidget {
  // TODO make different delete
  const NoteWidget(
      {super.key,
      required this.note,
      required this.onDeletePressed,
      required this.onBackSavePressed});
  final NoteModel note;
  final VoidCallback onDeletePressed;
  final VoidCallback onBackSavePressed;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 40,
        child: ElevatedButton(
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
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                      fontSize: 18)),
              const Spacer(),
              IconButton(
                  color: Theme.of(context).colorScheme.onPrimary,
                  iconSize: 20,
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    onDeletePressed();
                  })
            ])),
      ),
      const SizedBox(height: 5)
    ]);
  }
}
