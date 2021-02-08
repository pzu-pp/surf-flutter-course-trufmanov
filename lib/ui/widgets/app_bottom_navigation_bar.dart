import 'package:flutter/material.dart';

/// Виджет BottomNavigationBar
class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.list_alt,
            color: Theme.of(context).appBarTheme.textTheme.title.color,
          ),
          label: ' ',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.map_outlined,
            color: Theme.of(context).appBarTheme.textTheme.title.color,
          ),
          label: ' ',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_outlined,
            color: Theme.of(context).appBarTheme.textTheme.title.color,
          ),
          label: ' ',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings_outlined,
            color: Theme.of(context).appBarTheme.textTheme.title.color,
          ),
          label: ' ',
        ),
      ],
    );
  }
}
