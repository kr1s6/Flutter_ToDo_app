import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  const Note({super.key, required this.title, required this.content});
  final TextEditingController title;
  final TextEditingController content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      // ----------------------TOP--------------------------------
      appBar: AppBar(
        title: NoteAppBar(controllerTitle: title),
      ),
      // ----------------------Center-------------------------------
      body: NoteBody(controllerContent: content),
      // ----------------------BOTTOM--------------------------------
      bottomNavigationBar: const NoteBottomAppBar(),
      // floatingActionButton: FloatingActionButton(
      //   tooltip: 'save',
      //   onPressed: () {
      //     // Navigator.pushReplacementNamed(context, HomePage.routeName);
      //   },
      //   child: const Icon(Icons.save),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

class NoteAppBar extends StatefulWidget {
  const NoteAppBar({super.key, required this.controllerTitle});
  final TextEditingController controllerTitle;

  @override
  State<NoteAppBar> createState() => _NoteAppBarState();
}

class _NoteAppBarState extends State<NoteAppBar> {
  @override
  void initState() {
    super.initState();
    widget.controllerTitle.text = widget.controllerTitle.text;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Tooltip(
        message: "title",
        child: TextField(
          controller: widget.controllerTitle,
          textAlignVertical: TextAlignVertical.center,
          style: Theme.of(context).textTheme.titleMedium,
          maxLength: 25,
          maxLines: 1,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            counterText: "",
            filled: true,
            fillColor: Color.fromARGB(255, 213, 230, 209),
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}

class NoteBody extends StatefulWidget {
  const NoteBody({super.key, required this.controllerContent});
  final TextEditingController controllerContent;

  @override
  State<NoteBody> createState() => _NoteBodyState();
}

class _NoteBodyState extends State<NoteBody> {
  @override
  void initState() {
    super.initState();
    widget.controllerContent.text = widget.controllerContent.text;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: TextField(
        controller: widget.controllerContent,
        maxLines: null,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class NoteBottomAppBar extends StatelessWidget {
  const NoteBottomAppBar({super.key});

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
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
