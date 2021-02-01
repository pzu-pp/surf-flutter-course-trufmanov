import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/sight_image.dart';
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
          toolbarHeight: 135,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
            child: Text(
              'Избранное',
              style: TextStyle(
                  fontFamily: "Roboto", color: Colors.black, fontSize: 24),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 50),
            child: _VisitingScreenTabBar(),
          ),
        ),
        body: //Column(
            //children: [
            TabBarView(
          children: [
//            _WantToVisitEmptyTab(),
            _WantToVisitListTab(),
//             _VisitedEmptyTab(),
            _VisitedListTab(),
          ],
        ),
        bottomNavigationBar: AppBottomNavigationBar(),
      ),
    );
  }
}

class _VisitingScreenTabBar extends StatelessWidget {
  const _VisitingScreenTabBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Colors.black12,
        ),
        child: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black54,
          indicatorPadding: EdgeInsets.only(left: 16, right: 16),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: Color(0xFF3B3E5B),
          ),
          labelStyle: TextStyle(fontFamily: "Roboto", fontSize: 18),
          tabs: [
            Tab(
              text: 'Хочу посетить',
            ),
            Tab(
              text: 'Посетил',
            ),
          ],
        ),
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
      child: Column(children: [
        _VisitingSightCard(sight: mocks[1]),
        _VisitingSightCard(sight: mocks[2]),
      ]),
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
      child: Column(children: [
        _VisitingSightCard(sight: mocks[0]),
        _VisitingSightCard(sight: mocks[3]),
        _VisitingSightCard(sight: mocks[4]),
      ]),
    );
  }
}

class _VisitingSightCard extends StatelessWidget {
  final Sight sight;

  const _VisitingSightCard({Key key, @required this.sight})
      : assert(sight != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: AspectRatio(
      aspectRatio: 3 / 2,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Colors.black12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 96,
                  child: Stack(
                    children: [
                      SightImage(url: sight.url),
                      Positioned(
                        top: 16,
                        left: 16,
                        child: Text(
                          sight.type,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Positioned(
                        top: 18,
                        right: 19,
                        child: Container(
                          child: Image.asset(
                            'res/Close.png',
                            fit: BoxFit.fitWidth,
                          ),
                          color: Colors.transparent,
                          height: 30,
                          width: 30,
                        ),
                      ),
                      Positioned(
                        top: 18,
                        right: 59,
                        child: Container(
                          child: Image.asset(
                              sight.state==SightState.visited ? 'res/Share.png' : 'res/Calendar.png',
//                            _LeftIcon(sight.state),
                            fit: BoxFit.fitWidth,
                          ),
                          color: Colors.transparent,
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 92,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 12),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            sight.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            (sight.state==SightState.visited ? 'Цель достигнута ' : 'Запланировано на ') + sight.scheduled,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: sight.state==SightState.visited ? Colors.black54 : Colors.green,
                                fontFamily: "Roboto",
                                fontSize: 18),
                          ),
                        ),
                        SizedBox(height: 5),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            sight.info,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: "Roboto",
                                fontSize: 18),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
