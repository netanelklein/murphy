import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator(
      {super.key, required int selectedIndex, required this.onChanged})
      : _selectedIndex = selectedIndex;

  final ValueChanged<int> onChanged;
  final int _selectedIndex;

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        widget.onChanged(index);
      },
      selectedIndex: widget._selectedIndex,
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.feed_outlined),
          selectedIcon: Icon(Icons.feed),
          label: 'Feed',
        ),
        NavigationDestination(
          icon: Icon(Icons.sports_bar_outlined),
          selectedIcon: Icon(Icons.sports_bar_rounded),
          label: 'Our Beer',
        ),
        NavigationDestination(
          icon: Icon(Icons.shopping_bag_outlined),
          selectedIcon: Icon(Icons.shopping_bag),
          label: 'Shop',
        ),
      ],
    );
  }
}
