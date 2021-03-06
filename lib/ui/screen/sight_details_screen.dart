import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/sight_image.dart';

/// Класс виджета детальной информации отдельной достопримечательности
class SightDetailsScreen extends StatefulWidget {
  final Sight sight;

  /// Конструктор
  /// sight - класс достопримечательности, обязательный не null параметр
  SightDetailsScreen({Key key, @required this.sight})
      : assert(sight != null),
        super(key: key);

  @override
  _SightDetailsScreenState createState() => _SightDetailsScreenState();
}

class _SightDetailsScreenState extends State<SightDetailsScreen> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 360,
            flexibleSpace: Container(
              height: 360,
              child: Stack(
                children: [
                  PageView.builder(
                    onPageChanged: (value) =>
                        setState(() => _currentPage = value),
                    itemCount: widget.sight.urls.length,
                    itemBuilder: (context, index) => Container(
                      height: 360,
                      child: SightImage(
                        url: widget.sight.urls[index],
                      ),
                    ),
                  ),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Image.asset(
                          'res/Arrow.png',
                          height: 30,
                          color: Theme.of(context)
                              .appBarTheme
                              .textTheme
                              .title
                              .color,
                          colorBlendMode: BlendMode.modulate,
                          fit: BoxFit.fitHeight,
                        ),
                        onPressed: () => print('"<" pressed'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 352,
                    left: MediaQuery.of(context).size.width /
                        widget.sight.urls.length *
                        _currentPage,
                    child: SizedBox(
                      height: 8,
                      width: MediaQuery.of(context).size.width /
                          widget.sight.urls.length,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: Color(0xFF252849),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 24),
                  child: Column(
                    children: [
                      Text(
                        widget.sight.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Theme.of(context)
                                .appBarTheme
                                .textTheme
                                .title
                                .color,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold,
                            fontSize: 29),
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text(
                            widget.sight.type.name,
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
                            widget.sight.info,
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
                        widget.sight.details,
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
                      Container(
                        margin: EdgeInsets.only(
                            left: 10, top: 20, right: 10, bottom: 20),
                        height: 65,
                        child: RaisedButton(
                          color: Colors.green,
                          elevation: 0,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
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
        ],
      ),
    );
  }
}
