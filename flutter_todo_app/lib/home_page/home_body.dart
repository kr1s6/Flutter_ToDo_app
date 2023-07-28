import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var notesList = appState.notesList;

    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        if (notesList.isNotEmpty)
          for (var note in notesList) note
        else
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
          )
      ],
    );
  }
}
