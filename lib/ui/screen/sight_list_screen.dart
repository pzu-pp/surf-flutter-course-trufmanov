import 'package:flutter/material.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 200,
        title: Text(
          'Список\nинтересных мест',
          textAlign: TextAlign.left,
          maxLines: 2,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto-Regular.ttf',
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    );
  }
}