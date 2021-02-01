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
      appBar: SightAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: mocks.map((item) => SightCard(sight: item)).toList(),
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}

class SightAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SightAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 16.0, top: 64.0, right: 16.0, bottom: 16.0),
      child: Text(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150.0);
}
