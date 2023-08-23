import 'package:flutter/material.dart';

import '../../database/data_db.dart';
import '../controller/home_notifier.dart';
import 'note_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.value});
  final HomeNotifier value;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(5),
      children: <Widget>[
        if (notesList.isNotEmpty) ...[
          for (var note in notesList)
            NoteWidget(
              value: value,
              note: note,
            )
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
    );
  }
}
