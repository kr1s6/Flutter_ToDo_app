import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<Body> createState() => BodyState();
}

class BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
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
        style: TextStyle(
          color: Theme.of(context).focusColor,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
