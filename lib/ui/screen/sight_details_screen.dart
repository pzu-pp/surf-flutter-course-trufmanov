import 'package:flutter/cupertino.dart';
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
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: RaisedButton(
                      color: Theme.of(context).canvasColor,
                      elevation: 0,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Image.asset(
                        'res/Arrow.png',
                         height: 30,
                        color:
                            Theme.of(context).appBarTheme.textTheme.title.color,
                        colorBlendMode: BlendMode.modulate,
                        fit: BoxFit.fitHeight,
                      ),
                      onPressed: () => print('"<" pressed'),
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
                        left: 10, top: 20, right: 10, bottom: 20),
                    height: 65,
                    child: RaisedButton(
                      color: Colors.green,
                      elevation: 0,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
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
                          SizedBox(width: 5),
                          Text(
                            'ПОСТРОИТЬ МАРШРУТ',
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                      onPressed: () => print('"ПОСТРОИТЬ МАРШРУТ" pressed'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
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
                        onPressed: () => print('"Запланировать" pressed.'),
                      ),
                      TextButton(
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
                          ],
                        ),
                        onPressed: () => print('"В избранное" pressed.'),
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
