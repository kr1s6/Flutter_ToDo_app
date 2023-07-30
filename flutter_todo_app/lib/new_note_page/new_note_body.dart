import 'package:flutter/material.dart';

class NewNoteBody extends StatefulWidget {
  const NewNoteBody({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<NewNoteBody> createState() => NewNoteBodyState();
}

class NewNoteBodyState extends State<NewNoteBody> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.controller.text = widget.controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: TextField(
        controller: widget.controller,
        maxLines: null,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Note",
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
