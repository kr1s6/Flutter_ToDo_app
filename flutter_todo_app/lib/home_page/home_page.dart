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
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primaryContainer,
      // ----------------------TOP--------------------------------
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      // ----------------------Center-------------------------------
      body: HomeBody(updateController: updateController),
      // ----------------------BOTTOM--------------------------------
      bottomNavigationBar: const HomeBottomAppBar(),
      floatingActionButton: FloatingActionButton(
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
