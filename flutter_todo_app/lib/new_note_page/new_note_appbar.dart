import 'package:flutter/material.dart';

class NewNoteAppBar extends StatefulWidget {
  const NewNoteAppBar({super.key, required this.controllerTitle});
  final TextEditingController controllerTitle;

  @override
  State<NewNoteAppBar> createState() => NewNoteAppBarState();
}

class NewNoteAppBarState extends State<NewNoteAppBar> {
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
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            counterText: "",
            filled: true,
            fillColor: const Color.fromARGB(255, 213, 230, 209),
            border: const OutlineInputBorder(),
            hintText: "Title",
            hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
        ),
      ),
    );
  }
}
