import 'package:flutter/material.dart';
import 'package:flutter_todo_app/database.dart';
import 'package:flutter_todo_app/home_page/home_page.dart';
import 'package:flutter_todo_app/note/note.dart';

import '../main.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

void delete({required NoteModel note, required BuildContext context}) async {
  DatabaseHelper.instance.delete(note.id!).then((value) {
    notesList.remove(note);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Deleted')));
  }).catchError((e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  });
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(5),
      children: <Widget>[
        if (notesList.isNotEmpty) ...[
          for (var note in notesList) ...[
            NoteWidget(
              note: note,
              onDeletePressed: () {
                delete(note: note, context: context);
                HomePageState().getNotes();
              },
            )
          ]
        ] else ...[
          Container(
            alignment:
                AlignmentGeometry.lerp(Alignment.center, Alignment.center, 0),
            child: Text(
              "Add your first note",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.black.withOpacity(0.5)),
            ),
          ),
        ],
      ],
    );
  }
}

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key,
    required this.note,
    required this.onDeletePressed,
  });
  final NoteModel note;
  final VoidCallback onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Note(
                          title: note.titleController,
                          content: note.contentController,
                        )));
          },
          child: ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text(note.titleController.text),
            trailing: IconButton(
              icon: const Icon(Icons.delete, size: 20),
              onPressed: () {
                delete(note: note, context: context);
              },
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
