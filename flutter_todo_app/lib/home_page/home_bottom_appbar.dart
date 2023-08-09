import 'package:flutter/material.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:provider/provider.dart';

class HomeBottomAppBar extends StatelessWidget {
  const HomeBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<ThemeNotifier>();

    return BottomAppBar(
      notchMargin: 4,
      clipBehavior: Clip.antiAlias,
      // -------------------------------------------------
      child: IconTheme(
        data: const IconThemeData(color: Colors.black),
        child: Row(
          children: <Widget>[
            PopupMenuButton(
              color: const Color.fromARGB(255, 88, 186, 91),
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              padding: const EdgeInsets.all(0),
              offset: const Offset(0, -130),
              tooltip: "menu",
              onSelected: (value) {
                if (value == "Dark mode") {
                  appState.toggleMode();
                } else if (value == "Settings") {}
              },
              itemBuilder: (context) => [
                _buildPopupMenuItem("Settings", Icons.settings),
                _buildPopupMenuItem("Dark mode", Icons.wb_sunny),
              ],
            ),
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
      ),
    );
  }
}

PopupMenuItem _buildPopupMenuItem(String value, IconData icon) {
  return PopupMenuItem(
    value: value,
    child: Tooltip(
      message: value,
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(value, style: const TextStyle(fontSize: 18)),
        ],
      ),
    ),
  );
}
