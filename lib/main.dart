import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/sight_details_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';
import 'package:places/mocks.dart';

void main() {
  runApp(App());
}

// Главный виджет
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test app title...',
//        home: VisitingScreen(),
//        home: SightDetailsScreen(sight: mocks[4]),
      home: SightListScreen(),
    );
  }
}