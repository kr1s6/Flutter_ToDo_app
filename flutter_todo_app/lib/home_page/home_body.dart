import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var notesList = appState.notesList;

    return ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        if (notesList.isNotEmpty) ...[
          for (var note in notesList) ...[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => note));
              },
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Text(note.title.text),
                leading: const Text("content"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    appState.removeNote(note);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 4,
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
