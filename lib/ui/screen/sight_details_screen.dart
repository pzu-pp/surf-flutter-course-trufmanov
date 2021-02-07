import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/sight_image.dart';

/// Класс виджета детальной информации отдельной достопримечательности
class SightDetailsScreen extends StatelessWidget {
  final Sight sight;

  /// Конструктор
  /// sight - класс достопримечательности, обязательный не null параметр
  const SightDetailsScreen({Key key, @required this.sight})
      : assert(sight != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                      color: Theme.of(context).canvasColor,
                    ),
                    child: Center(
                      child: Image.asset(
                        'res/Arrow.png',
                        color:
                            Theme.of(context).appBarTheme.textTheme.title.color,
                        colorBlendMode: BlendMode.modulate,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 24),
              child: Column(
                children: [
                  Text(
                    sight.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color:
                            Theme.of(context).appBarTheme.textTheme.title.color,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        fontSize: 29),
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        sight.type,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Theme.of(context)
                                .appBarTheme
                                .textTheme
                                .title
                                .color,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(width: 20),
                      Text(
                        sight.info,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Text(
                    sight.details,
                    style: TextStyle(
                      color:
                          Theme.of(context).appBarTheme.textTheme.title.color,
                      fontFamily: "Roboto",
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, top: 20, right: 20, bottom: 5),
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.green,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Image.asset(
                            'res/empty_pages/GO.png',
                            color: Colors.white,
                            colorBlendMode: BlendMode.srcATop,
                          ),
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
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 10, top: 10, right: 5, bottom: 20),
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
                          margin: EdgeInsets.only(
                              left: 5, top: 10, right: 10, bottom: 20),
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
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .textTheme
                                        .title
                                        .color,
                                    fontFamily: "Roboto",
                                    fontSize: 18,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
