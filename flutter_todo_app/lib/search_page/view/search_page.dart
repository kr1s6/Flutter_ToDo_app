import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/search_controller.dart';
import 'search_appbar.dart';
import 'search_body.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  static const String routeName = '/home/search';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchNotifier>(
      create: (_) => SearchNotifier(),
      builder: (context, child) => Consumer<SearchNotifier>(
        builder: (_, value, __) => Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            title: SearchAppBar(value: value),
          ),
          body: SearchBody(value: value),
        ),
      ),
    );
  }
}
