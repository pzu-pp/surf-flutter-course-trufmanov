import 'package:flutter/material.dart';
import 'package:places/ui/widgets/sight_card.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/widgets/app_bottom_navigation_bar.dart';
import 'package:places/ui/screen/add_sight_screen.dart';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Material(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        child: Ink(
          width: 177,
          height: 48,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFCDD3D),
                Color(0xFF4CAF50),
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push( MaterialPageRoute( builder: (context) => AddSightScreen()));
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  SizedBox(width: 14),
                  Text(
                    'НОВОЕ МЕСТО',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
