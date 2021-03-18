import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/sight_image.dart';
import 'package:places/ui/widgets/sight_detail_bottom_sheet.dart';

enum SightCardType {
  simple,
  visiting,
}

/// Класс виджета карточки отдельной достопримечательности
class SightCard extends StatelessWidget {
  final Sight sight;
  final SightCardType cardType;
  final ValueChanged<Sight> onDelete;

  /// Конструктор
  /// sight - класс достопримечательности, обязательный не null параметр
  const SightCard(
      {Key key,
      @required this.sight,
      this.cardType = SightCardType.simple,
      @required this.onDelete})
      : assert(sight != null),
        assert(onDelete != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: MediaQuery.of(context).size.width - 32,
          child: AspectRatio(
            aspectRatio: 3 / 1.8,
            child: DefaultTextStyle(
              style: TextStyle(
                  color: Colors.black54, fontFamily: "Roboto", fontSize: 18),
              child: Material(
                color: Colors.black12,
                child: InkWell(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => Container(
                      height:
                          MediaQuery.of(context).copyWith().size.height - 100,
                      child: SightDetailBottomSheet(sight: sight),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 96,
                        child: Stack(
                          children: [
                            SightImage(url: sight.urls[0]),
                            Positioned(
                              top: 16,
                              left: 16,
                              child: Text(
                                sight.type.name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            sight.state == SightState.visited
                                ? Positioned(
                                    top: 0,
                                    right: 50,
                                    child: TextButton(
                                      child: Image.asset(
                                        'res/Share.png',
                                        fit: BoxFit.fitWidth,
                                        height: 30,
                                        width: 30,
                                      ),
                                      onPressed: () =>
                                          print('"Share" pressed.'),
                                    ),
                                  )
                                : Positioned(
                                    top: 0,
                                    right: 50,
                                    child: TextButton(
                                      child: Image.asset(
                                        'res/Calendar.png',
                                        fit: BoxFit.fitWidth,
                                        height: 30,
                                        width: 30,
                                      ),
                                      onPressed: () async {

                                        var res = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime.now()
                                              .add(Duration(days: 365)),
                                          locale: Locale("ru", "RU"),
                                        );

                                        // Из задания четко не понятно Date или
                                        // Time Picker нужен. Поэтому дополнительно
                                        // TimePicker на всякий случай.
                                        // var res = await showTimePicker(
                                        //   context: context,
                                        //   initialTime: TimeOfDay.now(),
                                        //);

                                        if (res != null) {
                                          print('Visit is scheduled for $res.');
                                        } else {
                                          print('Scheduling is canceled.');
                                        }
                                      },
                                    ),
                                  ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: TextButton(
                                child: Image.asset(
                                  'res/Close.png',
                                  fit: BoxFit.fitWidth,
                                  height: 30,
                                  width: 30,
                                ),
                                onPressed: () => onDelete(sight),
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
                                                ? 'Цель достигнута ' +
                                                    sight.scheduled
                                                : 'Запланировано на ' +
                                                    sight.scheduled,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: sight.state ==
                                                        SightState.visited
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
                                            style:
                                                TextStyle(color: Colors.grey),
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
          ),
        ),
      ),
    );
  }
}
