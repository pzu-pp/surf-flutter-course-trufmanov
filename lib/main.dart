import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/sight_details_screen.dart';
import 'package:places/mocks.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test app title...',
//      home: SightDetailsScreen(sight: mocks[0]),
      home: SightListScreen(),
//      home: MyFirstWidget_Stateless(),
    );
  }
}

class MyFirstWidget_Stateless extends StatelessWidget {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    _counter++;
    print("Stateless widget build counter = $_counter");
    // I/flutter ( 9920): Stateless widget build counter = 1
    // Stateless widget пересоздается при каждой отрисовке экрана (пересоздается
    // все дерево виджетом) - каждый раз это новый объект, build вызывается его
    // конструктором однократно.
    return Container(
      child: Center(
        child: Text("Hello"),
      ),
    );
  }

//  contextRuntimeType() {
//    return  context.runtimeType;
//  }

}

class MyFirstWidget_Stateful extends StatefulWidget {
  @override
  _MyFirstWidget_StatefulState createState() => _MyFirstWidget_StatefulState();
}

class _MyFirstWidget_StatefulState extends State<MyFirstWidget_Stateful> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    _counter++;
    print("Stateful widget build counter = $_counter"); // always shows 1, since widget re-builds
    // I/flutter ( 9920): Stateful widget build counter = 1
    // I/flutter ( 9920): Stateful widget build counter = 2
    // I/flutter ( 9920): Stateful widget build counter = 3
    // Непосредственно Stateful widget так же пересоздается при каждой отрисовке
    // экрана (вместе со всем деревом виджетов). Но он использует объект State
    // (при перерисовке вызывае его метод Build, а не собственный).
    // Время жизни State объекта не связано со временем жизни самого виджета.
    return Container(
      child: Center(
        child: Text("Hello"),
      ),
    );
  }

  contextRuntimeType() {
    return  context.runtimeType;
  }

}
