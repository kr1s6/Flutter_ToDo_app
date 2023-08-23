import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/editing_notifier.dart';
import 'bottom_appbar_editing.dart';
import 'body_home_editing.dart';

class HomeEditingPage extends StatelessWidget {
  const HomeEditingPage({super.key});
  static const String routeName = '/home/editing';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditingNotifier>(
      create: (_) => EditingNotifier(),
      builder: (context, child) => Consumer<EditingNotifier>(
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
            body: HomeEditingBody(value: value),
            // ------------------BOTTOM NAVIGATION BAR--------------------
            bottomNavigationBar: HomeBottomEditing(value: value)),
      ),
    );
  }
}
