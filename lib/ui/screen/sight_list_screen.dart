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
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'С',
                style: TextStyle(
                  color: Colors.green
                )
              ),
              TextSpan(
                text: 'писок\n'
              ),
              TextSpan(
                text: 'и',
                style: TextStyle(
                  color: Colors.yellow
                )
              ),
              TextSpan(
                text: 'нтересных мест'
              ),
            ],
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto-Regular.ttf',
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          textAlign: TextAlign.left,
          maxLines: 2,
        ),
      ),
    );
  }
}