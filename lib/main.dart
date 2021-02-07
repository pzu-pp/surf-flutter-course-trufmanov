import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/sight_details_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/res/themes.dart';

void main() => runApp(App());

/// Главный виджет
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeType _themeType = ThemeType.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Интересные места',
      theme: _themeType == ThemeType.light ? lightTheme : darkTheme,
//      home: VisitingScreen(),
//      home: SightListScreen(),
      home: SightDetailsScreen(sight: mocks[4]),
    );
  }
}
