import 'package:flutter/material.dart';
import 'package:places/ui/widgets/sight_card.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/widgets/app_bottom_navigation_bar.dart';

/// Класс виджета списка достопримечательностей
class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 108,
        title: Text('Список интересных мест'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: mocks.map((item) => SightCard(sight: item)).toList(),
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
