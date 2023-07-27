import 'package:flutter/material.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:provider/provider.dart';

class NewNotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      // ----------------------TOP--------------------------------
      appBar: AppBar(
        title: SizedBox(
          height: 35,
          child: Tooltip(
            message: "title",
            child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              style: Theme.of(context).textTheme.titleMedium,
              maxLength: 25,
              maxLines: 1,
              decoration: InputDecoration(
                counterText: "",
                filled: true,
                fillColor: Color.fromARGB(255, 213, 230, 209),
                border: OutlineInputBorder(),
                hintText: "Title",
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
          ),
        ),
      ),
      // ----------------------Center-------------------------------
      body: _NoteBody(),
      // ----------------------BOTTOM--------------------------------
      floatingActionButton: FloatingActionButton(
        tooltip: 'save',
        onPressed: () {
          appState.changePage();
        },
        backgroundColor: const Color.fromARGB(255, 76, 196, 80),
        shape: ShapeBorder.lerp(CircleBorder(), CircleBorder(), 0),
        child: const Icon(Icons.save),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: _CustomBottomAppBar(height: 40),
    );
  }
}

class _NoteBody extends StatelessWidget {
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
              style: Theme.of(context).textTheme.bodyLarge,
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
    var appState = context.watch<MyAppState>();
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
              tooltip: 'back',
              icon: const Icon(Icons.chevron_left_rounded),
              onPressed: () {
                appState.changePage();
              },
            ),
          ],
        ),
      ),
    );
  }
}
