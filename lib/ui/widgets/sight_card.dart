import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/sight_image.dart';

/// Класс виджета карточки отдельной достопримечательности
class SightCard extends StatelessWidget {
  final Sight sight;

/// Конструктор
/// sight - класс достопримечательности, обязательный не null параметр
  const SightCard({Key key, @required this.sight})
      : assert(sight != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
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
                            'res/Heart.png',
                          ),
                          color: Colors.transparent,
                          height: 30,
                          width: 30,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 92,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
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
                        SizedBox(height: 2),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            sight.details,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: "Roboto",
                                fontSize: 18),
                          ),
                        ),
                        SizedBox(height: 10),
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
