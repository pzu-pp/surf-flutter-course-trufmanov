import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/sight_image.dart';

// Класс виджета детальной информации отдельной достопримечательности
class SightDetailsScreen extends StatelessWidget {
  final Sight sight;

// Конструктор
// sight - класс достопримечательности, обязательный не null параметр
  const SightDetailsScreen({Key key, @required this.sight})
      : assert(sight != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      SightImage(url: sight.url),
                      Positioned(
                        top: 50,
                        left: 20,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Image.asset(
                              'res/Arrow.png',
                              color: Colors.black,
                              colorBlendMode: BlendMode.modulate,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, top: 10, right: 10, bottom: 5),
                    child: Text(
                      sight.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          fontSize: 29),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
                    child: Text(
                      sight.type,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, top: 5, right: 10, bottom: 10),
                    child: Text(
                      sight.details,
                      style: TextStyle(fontFamily: "Roboto", fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 5),
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.green,
            ),
//            child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'res/GO.png',
                ),
                Text(
                  '  ПОСТРОИТЬ МАРШРУТ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
//            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 10, right: 5, bottom: 20),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'res/Calendar.png',
                        color: Colors.grey,
                        colorBlendMode: BlendMode.modulate,
                      ),
                      Text(
                        ' Запланировать',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin:
                      EdgeInsets.only(left: 5, top: 10, right: 10, bottom: 20),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.transparent,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'res/Heart.png',
                          color: Colors.black,
                          colorBlendMode: BlendMode.modulate,
                        ),
                    Text(
                      ' В избранное',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 18),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
