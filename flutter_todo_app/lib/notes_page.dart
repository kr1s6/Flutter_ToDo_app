import 'package:flutter/material.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var notesList = appState.notesList;
    final theme = Theme.of(context);
    final style = theme.textTheme.titleLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      // ----------------------TOP--------------------------------
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: Colors.green[700],
        title: const Text(
          'ToDo',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      // ----------------------Center-------------------------------
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          if (notesList.isNotEmpty)
            for (var note in notesList)
              Container(
                child: note,
              )
          else
            Container(
              alignment:
                  AlignmentGeometry.lerp(Alignment.center, Alignment.center, 0),
              child: Text("Empty"),
            )
        ],
      ),
      // ----------------------BOTTOM--------------------------------
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          appState.changePage();
        },
        backgroundColor: Colors.green,
        shape: ShapeBorder.lerp(CircleBorder(), CircleBorder(), 0),
        child: const Icon(Icons.create),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _CustomBottomAppBar(height: 40),
    );
  }
}

class _CustomBottomAppBar extends StatelessWidget {
  const _CustomBottomAppBar({this.height = 40});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 3,
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
