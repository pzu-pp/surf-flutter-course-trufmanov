import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/sight_card.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/widgets/app_bottom_navigation_bar.dart';
import 'package:places/ui/widgets/draggable_sight_card.dart';

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
            mocks.where((item) => item.state == SightState.scheduled).isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'res/empty_pages/Card.png',
                      ),
                      Text(
                        'Пусто',
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 24,
                            color: Colors.black26),
                      ),
                      Text(
                        'Отмечайте понравившиеся\nместа и они появятся здесь.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 16,
                            color: Colors.black26),
                      ),
                    ],
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: mocks
                          .where((item) => item.state == SightState.scheduled)
                          .map(
                            (item) => DraggableSightCard(
                              sight: item,
                              cardType: SightCardType.visiting,
                              onDelete: (value) => setState(
                                  () => value.state = SightState.unknown),
                              onChange: () => setState(() {}),
                            ),
                          )
                          .toList(),
                    ),
                  ),
            mocks.where((item) => item.state == SightState.visited).isEmpty
                ? Column(
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
                            fontFamily: "Roboto",
                            fontSize: 24,
                            color: Colors.black26),
                      ),
                      Text(
                        'Завершите маршрут,\nчто бы место попало сюда.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 16,
                            color: Colors.black26),
                      ),
                    ],
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: mocks
                          .where((item) => item.state == SightState.visited)
                          .map(
                            (item) => DraggableSightCard(
                              sight: item,
                              cardType: SightCardType.visiting,
                              onDelete: (value) => setState(
                                  () => value.state = SightState.unknown),
                              onChange: () => setState(() {}),
                            ),
                          )
                          .toList(),
                    ),
                  ),
          ],
        ),
        bottomNavigationBar: AppBottomNavigationBar(),
      ),
    );
  }
}
