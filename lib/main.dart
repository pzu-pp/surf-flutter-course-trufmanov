import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      home: MyFirstWidget_Stateless(),
      home: MyFirstWidget_Stateful(),

//      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
}
