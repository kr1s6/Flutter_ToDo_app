import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

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
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: TextField(
        expands: true,
        controller: widget.controllerContent,
        onChanged: (value) {
          print(widget.controllerContent.text);
          appState.notification();
        },
        maxLines: null,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
