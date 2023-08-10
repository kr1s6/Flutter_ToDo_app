import 'package:flutter/material.dart';

import '../new_note_page/new_note_page.dart';
import 'home_body.dart';
import 'home_bottom_appbar.dart';

class HomePageController {
  late void Function() updateBodyState;
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  static const String routeName = '/home';

  final HomePageController updateController = HomePageController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      // ----------------------TOP--------------------------------
      appBar: AppBar(
        toolbarHeight: 50,
        title: Text(
          'Notes',
          style: theme.appBarTheme.titleTextStyle?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      // ----------------------Center-------------------------------
      body: HomeBody(updateController: updateController),
      // ----------------------BOTTOM--------------------------------
      bottomNavigationBar: const HomeBottomAppBar(),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.pushNamed(context, NewNotePage.routeName).then((value) {
            if (value == true) {
              updateController.updateBodyState();
            }
          });
        },
        child: const Icon(Icons.create),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
