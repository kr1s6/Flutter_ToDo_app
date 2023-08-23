import 'package:flutter/material.dart';
import 'package:flutter_todo_app/home_page/controller/home_notifier.dart';

import '../../search_page/view/search_page.dart';
import '../../theme/theme_controller.dart';

class HomeBottomAppBar extends StatelessWidget {
  const HomeBottomAppBar({super.key, required this.theme, required this.value});
  final ThemeNotifier theme;
  final HomeNotifier value;
  @override
  Widget build(BuildContext context) {
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
            icon: Icon(Icons.menu, color: Theme.of(context).iconTheme.color),
            padding: const EdgeInsets.all(0),
            offset: const Offset(0, -100),
            tooltip: "menu",
            onSelected: (value) {
              if (value == "Theme") {
                theme.changeThemeMode();
              } else if (value == "Settings") {}
            },
            itemBuilder: (context) => [
              _buildPopupMenuItem(
                  "Settings", "Settings", Icons.settings, context),
              _buildPopupMenuItem(
                  "Theme", theme.themeString, theme.themeIcon, context),
            ],
          ),
          // -------------------------------------------------------------
          const Spacer(),
          IconButton(
            padding: const EdgeInsets.all(0),
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.routeName)
                  .then((_) => value.refresh());
            },
          ),
        ],
      ),
    );
  }
}

PopupMenuItem _buildPopupMenuItem(
    String value, String text, IconData icon, BuildContext context) {
  return PopupMenuItem(
    height: 38,
    padding: const EdgeInsets.only(left: 8),
    value: value,
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
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ],
    ),
  );
}
