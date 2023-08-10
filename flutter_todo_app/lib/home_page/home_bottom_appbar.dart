import 'package:flutter/material.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:provider/provider.dart';

class HomeBottomAppBar extends StatelessWidget {
  const HomeBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<ThemeNotifier>();

    return BottomAppBar(
      height: 40,
      padding: const EdgeInsets.all(5),
      shape: const CircularNotchedRectangle(),
      notchMargin: 4,
      clipBehavior: Clip.antiAlias,
      // -------------------------------------------------
      child: Row(
        children: <Widget>[
          PopupMenuButton(
            icon: const Icon(Icons.menu),
            padding: const EdgeInsets.all(0),
            offset: const Offset(0, -110),
            tooltip: "menu",
            onSelected: (value) {
              if (value == "Dark mode") {
                appState.toggleMode();
              } else if (value == "Settings") {}
            },
            itemBuilder: (context) => [
              _buildPopupMenuItem("Settings", Icons.settings, context),
              _buildPopupMenuItem("Dark mode", Icons.wb_sunny, context),
            ],
          ),
          // -------------------------------------------------------------
          const Spacer(),
          IconButton(
            // TODO make search button
            padding: const EdgeInsets.all(0),
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

PopupMenuItem _buildPopupMenuItem(
    String value, IconData icon, BuildContext context) {
  return PopupMenuItem(
    height: 38,
    padding: const EdgeInsets.only(left: 8),
    value: value,
    child: Tooltip(
      message: value,
      child: Row(
        children: [
          Icon(
            icon,
            size: 23,
            color: Theme.of(context).iconTheme.color,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(value,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onPrimary,
              )),
        ],
      ),
    ),
  );
}
