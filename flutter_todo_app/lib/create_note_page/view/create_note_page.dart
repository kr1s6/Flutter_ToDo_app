import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/create_note_notifier.dart';
import 'title_create_note.dart';
import 'body_create_note.dart';

class NewNotePage extends StatelessWidget {
  const NewNotePage({super.key});
  static const String routeName = '/home/new_note';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CreateNoteNotifier>(
      create: (_) => CreateNoteNotifier(),
      child: Consumer<CreateNoteNotifier>(
        builder: (_, value, __) => Scaffold(
          // ----------------------TOP--------------------------------
          appBar: AppBar(
              toolbarHeight: 50,
              automaticallyImplyLeading: false,
              titleSpacing: 0,
              title: Row(children: [
                IconButton(
                    iconSize: 20,
                    tooltip: 'back & save',
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => value.backAndSave(context)),
                Expanded(child: TitleAppBar(controller: value.titleController)),
              ])),
          // ----------------------Center-------------------------------
          body: Body(controller: value.contentController),
          // ----------------------BOTTOM--------------------------------
        ),
      ),
    );
  }
}
