import 'package:flutter/material.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Tooltip(
        message: "title",
        child: TextField(
          controller: controller,
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
            fillColor: Theme.of(context).colorScheme.secondary,
            border: const OutlineInputBorder(),
            hintText: "Title",
            // fillColor:
          ),
        ),
      ),
    );
  }
}
