import 'package:flutter/material.dart';

import '../controller/editing_notifier.dart';

class HomeBottomEditing extends StatelessWidget {
  const HomeBottomEditing({super.key, required this.value});
  final EditingNotifier value;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).colorScheme.tertiary,
      height: 50,
      padding: const EdgeInsets.all(5),
      shape: const CircularNotchedRectangle(),
      notchMargin: 4,
      clipBehavior: Clip.antiAlias,
      // -------------------------------------------------
      child: Row(
        children: <Widget>[
          const Spacer(),
          IconButton(
            padding: const EdgeInsets.all(0),
            tooltip: 'Delete',
            icon: const Icon(Icons.delete, size: 30),
            onPressed: () {
              print('Pressed Trashcan.');
              value.deleteNotes(context);
            },
          ),
        ],
      ),
    );
  }
}
