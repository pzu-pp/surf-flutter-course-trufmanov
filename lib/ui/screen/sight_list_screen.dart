import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/widgets/sight_card.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/widgets/app_bottom_navigation_bar.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/widgets/search_text_field.dart';
import 'package:places/ui/screen/sight_search_screen.dart';
import 'package:places/ui/screen/sight_details_screen.dart';

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
        title: Text('Список интересных мест'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 118,
            flexibleSpace: Center(
              child: PreferredSize(
                preferredSize: Size(double.infinity, 52),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SightSearchScreen())),
                  child: Container(
                    height: 55,
                    margin: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Colors.black12,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.grey,
                          ),
                          Expanded(
                            child: Text(
                              'Поиск',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          TextButton(
                            child: Image.asset(
                              'res/Filter.png',
                              fit: BoxFit.fitWidth,
                              height: 30,
                              width: 30,
                              color: Colors.green,
                            ),
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => FiltersScreen())),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 1
                      : 2,
              childAspectRatio: 3 / 1.8,
            ),
            delegate: SliverChildListDelegate(
              [
                for (int i = 0; i < mocks.length; i++)
                  SightCard(
                    sight: mocks[i],
                    onDelete: (value) {},
                  ),
              ],
            ),
          ),
        ],
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddSightScreen()));
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
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: 0,
      ),
    );
  }
}
