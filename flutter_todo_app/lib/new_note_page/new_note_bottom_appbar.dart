import 'package:flutter/material.dart';
import 'package:flutter_todo_app/home_page/home_page.dart';

class NewNoteBottomAppBar extends StatelessWidget {
  const NewNoteBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 4,
      clipBehavior: Clip.antiAlias,
      // -------------------------------------------------
      child: IconTheme(
        data: const IconThemeData(color: Colors.black),
        child: Row(
          children: <Widget>[
            IconButton(
              padding: const EdgeInsets.all(0),
              tooltip: 'back',
              icon: const Icon(Icons.chevron_left_rounded),
              onPressed: () {
                Navigator.pushReplacementNamed(context, HomePage.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
