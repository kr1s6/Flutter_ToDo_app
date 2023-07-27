import 'package:flutter/material.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    // final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      // ----------------------TOP--------------------------------
      appBar: AppBar(
        title: const Text(
          'ToDo',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      // ----------------------Center-------------------------------
      body: _BodyNotesList(),
      // ----------------------BOTTOM--------------------------------
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          appState.changePage();
        },
        backgroundColor: const Color.fromARGB(255, 76, 196, 80),
        shape: ShapeBorder.lerp(CircleBorder(), CircleBorder(), 0),
        tooltip: 'new note',
        child: const Icon(Icons.create),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _CustomBottomAppBar(height: 40),
    );
  }
}

class _BodyNotesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var notesList = appState.notesList;

    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        if (notesList.isNotEmpty)
          for (var note in notesList) note
        else
          Container(
            alignment:
                AlignmentGeometry.lerp(Alignment.center, Alignment.center, 0),
            child: Text(
              "Add your first note",
              style: TextStyle(fontSize: 15),
            ),
          )
      ],
    );
  }
}

class _CustomBottomAppBar extends StatelessWidget {
  const _CustomBottomAppBar({this.height = 40});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 4,
      padding: EdgeInsets.all(5),
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      height: height,
      color: Color.fromARGB(255, 76, 175, 102),
      // -------------------------------------------------
      child: IconTheme(
        data: IconThemeData(color: Colors.black),
        child: Row(
          children: <Widget>[
            IconButton(
              padding: EdgeInsets.all(0),
              tooltip: 'Open navigation menu',
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            Spacer(),
            IconButton(
              padding: EdgeInsets.all(0),
              tooltip: 'Search',
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
