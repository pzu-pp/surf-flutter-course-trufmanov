import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/mocks.dart';

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
        toolbarHeight: 150,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SightCard(sight: mocks[0]),
            SightCard(sight: mocks[1]),
            SightCard(sight: mocks[2]),
            SightCard(sight: mocks[3]),
            SightCard(sight: mocks[4]),
          ]
//        children: mocks.map((item) => SightCard(sight: item)).toList(),
        ),
      ),
    );
  }
}