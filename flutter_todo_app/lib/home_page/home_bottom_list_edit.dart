import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class HomeBottomListEdit extends StatelessWidget {
  const HomeBottomListEdit({super.key});

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
              Provider.of<NoteLongPressedProvider>(context, listen: false)
                  .deleteNotes(context);
            },
          ),
        ],
      ),
    );
  }
}
