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
    widget.controller.text =
        "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
    widget.controller.selection =
        TextSelection.fromPosition(const TextPosition(offset: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: TextField(
        expands: true,
        autofocus: true,
        controller: widget.controller,
        maxLines: null,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
