import 'package:flutter/material.dart';

class NewNotePageAppBar extends StatelessWidget {
  const NewNotePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Tooltip(
        message: "title",
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          style: Theme.of(context).textTheme.titleMedium,
          maxLength: 25,
          maxLines: 1,
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
