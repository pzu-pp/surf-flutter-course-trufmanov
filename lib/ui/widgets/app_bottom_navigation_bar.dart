import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';
import 'package:places/ui/screen/settings_screen.dart';

/// Виджет BottomNavigationBar
class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const AppBottomNavigationBar({
    this.currentIndex,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: currentIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SightListScreen(),
              ),
            );
            break;

          case 1:
            break;

          case 2:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => VisitingScreen(),
              ),
            );
            break;

          case 3:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SettingsScreen(),
              ),
            );
            break;
        }
      },
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
