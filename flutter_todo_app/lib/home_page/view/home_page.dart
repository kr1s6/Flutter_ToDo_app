import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../create_note_page/view/create_note_page.dart';
import '../../theme/theme_controller.dart';
import '../controller/home_notifier.dart';
import 'body_home.dart';
import 'bottom_home_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.theme});
  final ThemeNotifier theme;
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeNotifier>(
      create: (_) => HomeNotifier(),
      builder: (context, child) => Consumer<HomeNotifier>(
        builder: (_, value, __) => Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
            title: Text(
              'Notes',
              style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
            ),
          ),
          // ----------------------Center-------------------------------
          body: HomeBody(value: value),
          // ------------------BOTTOM NAVIGATION BAR--------------------
          bottomNavigationBar: HomeBottomAppBar(theme: theme, value: value),
          // -------------------FLOATING ACTION BUTTON-------------------
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {
              Navigator.pushNamed(context, NewNotePage.routeName)
                  .then((embody) {
                if (embody == true) {
                  value.refresh();
                }
              });
            },
            child: const Icon(Icons.create),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}
