import 'package:flutter/material.dart';

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
          icon: Image.asset(
            'res/List.png',
            color: Colors.black,
            colorBlendMode: BlendMode.modulate,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'res/Map.png',
            color: Colors.black,
            colorBlendMode: BlendMode.modulate,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'res/Heart.png',
            color: Colors.black,
            colorBlendMode: BlendMode.modulate,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'res/Settings.png',
            color: Colors.black,
            colorBlendMode: BlendMode.modulate,
          ),
          label: '',
        ),
      ],
    );
  }
}
