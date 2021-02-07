import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/sight_card.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/widgets/app_bottom_navigation_bar.dart';

/// Экран виджет "Хочу посетить"/"Посещенные места"
class VisitingScreen extends StatefulWidget {
  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

/// Состояние виджета "Хочу посетить"/"Посещенные места"
class _VisitingScreenState extends State<VisitingScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 108,
          title: Text('Избранное'),
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 52),
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Colors.black12,
              ),
              child: TabBar(
                tabs: [
                  Tab(text: 'Хочу посетить'),
                  Tab(text: 'Посетил'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
//            _WantToVisitEmptyTab(),
            _WantToVisitListTab(),
//            _VisitedEmptyTab(),
            _VisitedListTab(),
          ],
        ),
        bottomNavigationBar: AppBottomNavigationBar(),
      ),
    );
  }
}

class _WantToVisitEmptyTab extends StatelessWidget {
  const _WantToVisitEmptyTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'res/empty_pages/Card.png',
        ),
        Text(
          'Пусто',
          style: TextStyle(
              fontFamily: "Roboto", fontSize: 24, color: Colors.black26),
        ),
        Text(
          'Отмечайте понравившиеся\nместа и они появятся здесь.',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: "Roboto", fontSize: 16, color: Colors.black26),
        ),
      ],
    );
  }
}

class _WantToVisitListTab extends StatelessWidget {
  const _WantToVisitListTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: mocks
            .where((item) => item.state == SightState.scheduled)
            .map((item) =>
                SightCard(sight: item, cardType: SightCardType.visiting))
            .toList(),
      ),
    );
  }
}

class _VisitedEmptyTab extends StatelessWidget {
  const _VisitedEmptyTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'res/empty_pages/GO.png',
          color: Colors.black26,
          colorBlendMode: BlendMode.modulate,
        ),
        Text(
          'Пусто',
          style: TextStyle(
              fontFamily: "Roboto", fontSize: 24, color: Colors.black26),
        ),
        Text(
          'Завершите маршрут,\nчто бы место попало сюда.',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: "Roboto", fontSize: 16, color: Colors.black26),
        ),
      ],
    );
  }
}

class _VisitedListTab extends StatelessWidget {
  const _VisitedListTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: mocks
            .where((item) => item.state == SightState.visited)
            .map((item) =>
                SightCard(sight: item, cardType: SightCardType.visiting))
            .toList(),
      ),
    );
  }
}
