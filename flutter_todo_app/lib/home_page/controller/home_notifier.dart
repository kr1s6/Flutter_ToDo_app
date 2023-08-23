import 'package:flutter/material.dart';

import '../../database/data_db.dart';
import '../../home_editing_page/controller/editing_notifier.dart';
import '../../home_editing_page/view/home_editing_page.dart';

class HomeNotifier extends ChangeNotifier {
  void refresh() {
    print('Home Refresh');
    notifyListeners();
  }

  void onBackSavePressed(note) {
    DataDB.update(note: note).then((_) {
      print('BackSavePressed');
      notifyListeners();
    });
  }

  void onNoteLongPressed(context, note) {
    print('Long pressed Note.');
    notesEditList.add(note);
    Navigator.pushNamed(context, HomeEditingPage.routeName)
        .then((value) => refresh());
  }
}
