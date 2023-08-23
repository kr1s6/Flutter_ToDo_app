import 'package:flutter/material.dart';

import '../controller/search_controller.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key, required this.value});
  final SearchNotifier value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Tooltip(
        message: "search",
        child: TextField(
          onChanged: (_) => value.searchUpdate(),
          controller: value.searchController,
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
            hintText: "Search",
            // fillColor:
          ),
        ),
      ),
    );
  }
}
