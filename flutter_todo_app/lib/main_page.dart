import 'package:flutter/material.dart';
import 'package:flutter_todo_app/favorite_page.dart';
import 'package:flutter_todo_app/generator_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SafeArea(
              child: Container(
                child: page,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          shape: ShapeBorder.lerp(CircleBorder(), CircleBorder(), 0),
          child: const Icon(Icons.create),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _CustomBottomAppBar(height: 40),
      );
    });
  }
}

// child: NavigationRail(
//                 minExtendedWidth: 180,
//                 extended: constraints.maxWidth >= 600,
//                 destinations: [
//                   NavigationRailDestination(
//                     icon: Icon(Icons.home),
//                     label: Text("Home"),
//                   ),
//                   NavigationRailDestination(
//                     icon: Icon(Icons.favorite),
//                     label: Text("Favorities"),
//                   ),
//                 ],
//                 selectedIndex: selectedIndex,
//                 onDestinationSelected: (value) {
//                   setState(() {
//                     selectedIndex = value;
//                   });
//                 },
//               ),

class _CustomBottomAppBar extends StatelessWidget {
  const _CustomBottomAppBar({this.height = 40});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 3,
      padding: EdgeInsets.all(5),
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      height: height,
      color: Color.fromARGB(255, 76, 175, 102),
      child: IconTheme(
        data: IconThemeData(color: Colors.black),
        child: Row(
          children: <Widget>[
            IconButton(
              padding: EdgeInsets.all(0),
              tooltip: 'Open navigation menu',
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            Spacer(),
            IconButton(
              padding: EdgeInsets.all(0),
              tooltip: 'Search',
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
