import 'package:flutter/material.dart';

/// Типы тем
enum ThemeType {
  light,
  dark,
}

/// Светлая тема
final lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    textTheme: TextTheme(
      title: TextStyle(
          fontFamily: "Roboto",
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 24),
    ),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: Colors.white,
    unselectedLabelColor: Colors.black54,
    indicator: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(25)),
      color: Color(0xFF3B3E5B),
    ),
    unselectedLabelStyle: TextStyle(fontFamily: "Roboto", fontSize: 18),
    labelStyle: TextStyle(fontFamily: "Roboto", fontSize: 18),
  ),
);

/// Темная тема
final darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    textTheme: TextTheme(
      title: TextStyle(
          fontFamily: "Roboto",
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 24),
    ),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: Colors.black,
    unselectedLabelColor: Colors.grey,
    indicator: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(25)),
      color: Colors.white,
    ),
    unselectedLabelStyle: TextStyle(fontFamily: "Roboto", fontSize: 18),
    labelStyle: TextStyle(fontFamily: "Roboto", fontSize: 18),
  ),
  canvasColor: Color(0xFF2D2E3E),
);
