import 'package:flutter/material.dart';

import '../../database/data_db.dart';

class SearchNotifier extends ChangeNotifier {
  final searchController = TextEditingController();

  void onBackSavePressed(note, context) {
    DataDB.update(note: note).then((_) {
      print('BackSavePressed');
      Navigator.pop(context);
    });
  }

  void searchUpdate() {
    notifyListeners();
  }
}
