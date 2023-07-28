import 'package:flutter/material.dart';

class NewNoteBody extends StatelessWidget {
  const NewNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: TextField(
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
