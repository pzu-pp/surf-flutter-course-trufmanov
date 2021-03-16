import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/res/themes.dart';
import 'package:places/ui/screen/splash_screen.dart';

void main() => runApp(App());

/// Главный виджет
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Интересные места',
      theme: themeType == ThemeType.light ? lightTheme : darkTheme,
      home: SplashScreen(),
    );
  }
}
