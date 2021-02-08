import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/sight_image.dart';

enum SightCardType {
  simple,
  visiting,
}

/// Класс виджета карточки отдельной достопримечательности
class SightCard extends StatelessWidget {
  final Sight sight;
  final SightCardType cardType;

  /// Конструктор
  /// sight - класс достопримечательности, обязательный не null параметр
  const SightCard(
      {Key key,
      @required this.sight,
      @required this.cardType = SightCardType.simple})
      : assert(sight != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.infinity,
          color: Colors.black12,
          child: DefaultTextStyle(
            style: TextStyle(
                color: Colors.black54, fontFamily: "Roboto", fontSize: 18),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 96,
                  child: Stack(
                    children: [
                      SightImage(url: sight.url),
                      Positioned(
                        top: 16,
                        left: 16,
                        child: Text(
                          sight.type,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        top: 18,
                        right: 59,
                        child: Image.asset(
                          sight.state == SightState.visited
                              ? 'res/Share.png'
                              : 'res/Calendar.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Positioned(
                        top: 18,
                        right: 19,
                        child: Image.asset(
                          'res/Close.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Container(
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
                              color: Theme.of(context)
                                  .appBarTheme
                                  .textTheme
                                  .title
                                  .color,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 2),
                        cardType == SightCardType.simple
                            ? Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  sight.info,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              )
                            : Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      sight.state == SightState.visited
                                          ? 'Цель достигнута ' + sight.scheduled
                                          : 'Запланировано на ' +
                                              sight.scheduled,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color:
                                              sight.state == SightState.visited
                                                  ? Colors.grey
                                                  : Colors.green),
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      sight.info,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ],
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
