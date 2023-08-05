import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Tooltip(
        message: "title",
        child: TextField(
          controller: widget.controllerTitle,
          style: Theme.of(context).textTheme.titleMedium,
          maxLength: 25,
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
