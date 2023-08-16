import 'package:flutter/material.dart';
import 'package:flutter_todo_app/home_page/home_bottom_list_edit.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:provider/provider.dart';

import '../database.dart';
import '../new_note_page/new_note_page.dart';
import 'home_body.dart';
import 'home_bottom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.theme});
  final ThemeNotifier theme;
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BodyUpdateProvider>(
          create: (_) => BodyUpdateProvider(),
        ),
        ChangeNotifierProvider<NoteLongPressedProvider>(
          create: (_) => NoteLongPressedProvider(),
        ),
      ],
      builder: (context, child) => Scaffold(
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
        body: HomeBody(),
        // ------------------BOTTOM NAVIGATION BAR--------------------
        bottomNavigationBar: Consumer<NoteLongPressedProvider>(
          builder: (_, value, __) => value.noteLongPressed
              ? const HomeBottomListEdit()
              : HomeBottomAppBar(theme: theme),
        ),
        // -------------------FLOATING ACTION BUTTON-------------------
        floatingActionButton: Consumer<NoteLongPressedProvider>(
          builder: (_, value, __) {
            return Visibility(
              visible: value.noteLongPressed ? false : true,
              child: FloatingActionButton(
                shape: const CircleBorder(),
                onPressed: () {
                  Navigator.pushNamed(context, NewNotePage.routeName)
                      .then((value) {
                    if (value == true) {
                      Provider.of<BodyUpdateProvider>(context, listen: false)
                          .refreshBody();
                    }
                  });
                },
                child: const Icon(Icons.create),
              ),
            );
          },
        ),
        floatingActionButtonLocation:
            Provider.of<NoteLongPressedProvider>(context)
                .floatingActionButtonLocation,
      ),
    );
  }
}

class BodyUpdateProvider extends ChangeNotifier {
  void refreshBody() {
    notifyListeners();
  }
}

class NoteLongPressedProvider extends ChangeNotifier {
  List notesEditList = <NoteModel>[];

  void addToEditList(NoteModel note) {
    if (notesEditList.contains(note)) {
      notesEditList.remove(note);
      print("note removed from notesEditList");
    } else {
      notesEditList.add(note);
      print("note added to notesEditList");
    }
    notifyListeners();
  }

  void deleteNotes(context) {
    _noteLongPressed = false;
    print("onTrashcan");
    if (notesEditList.isNotEmpty) {
      for (var note in notesEditList) {
        DataDB.delete(note: note, context: context).then((_) {
          print("onTrashcan before notify");
          notifyListeners();
          print("After notify");
        });
      }
    }
  }

  bool _noteLongPressed = false;
  bool get noteLongPressed => _noteLongPressed;

  final _centerDocked = FloatingActionButtonLocation.centerDocked;
  final _centerFloat = FloatingActionButtonLocation.centerFloat;
  FloatingActionButtonLocation get floatingActionButtonLocation =>
      _noteLongPressed ? _centerFloat : _centerDocked;

  void onNoteLongPressed() {
    _noteLongPressed = true;
    print("Long press function");
    notifyListeners();
  }
}
