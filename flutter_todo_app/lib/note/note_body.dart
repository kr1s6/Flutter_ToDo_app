import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: TextField(
        expands: true,
        controller: widget.controllerContent,
        maxLines: null,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
