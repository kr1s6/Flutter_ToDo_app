import 'package:flutter/material.dart';

import '../../database/data_db.dart';
import '../../database/note_model.dart';
import '../controller/search_controller.dart';
import 'search_note_widget.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key, required this.value});
  final SearchNotifier value;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(5),
      children: <Widget>[
        if (notesList.isNotEmpty) ...[
          for (NoteModel note in notesList)
            if (note.titleController.text
                .contains(value.searchController.text)) ...[
              SearchNoteWidget(
                value: value,
                note: note,
              )
            ]
        ] else ...[
          Container(
            alignment:
                AlignmentGeometry.lerp(Alignment.center, Alignment.center, 0),
            child: Text(
              "Nothing",
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
