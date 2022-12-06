import 'package:flutter/material.dart';
import 'package:murphy/app_state.dart';
import 'package:provider/provider.dart';

import '../../screens/feed/feed.dart';
import '../../screens/our_beer/our_beer.dart';
import '../../screens/shop/shop.dart';
import 'bottom_navigator.dart';
import 'drawer_menu.dart';
import '../../models/beer.dart';

class RootNavigation extends StatefulWidget {
  const RootNavigation({super.key});

  @override
  State<RootNavigation> createState() => _RootNavigationState();
}

class _RootNavigationState extends State<RootNavigation> {
  int _selectedIndex = 0;

  void setSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: const Text(
            "Murphy's Beer",
            style: TextStyle(fontFamily: 'Nerko One'),
          ),
          // actions: [],
        ),
        body: <Widget>[
          const Feed(),
          Consumer<AppState>(
              builder: ((context, appState, _) =>
                  OurBeer(beerList: appState.beerList))),
          const Shop(),
        ][_selectedIndex],
        drawer: const DrawerMenu(),
        bottomNavigationBar: BottomNavigator(
          selectedIndex: _selectedIndex,
          onChanged: setSelectedIndex,
        ));
  }
}
