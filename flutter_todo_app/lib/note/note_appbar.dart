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
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).focusColor),
          maxLength: 25,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            counterText: "",
            filled: true,
            fillColor: Theme.of(context).colorScheme.primary,
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
