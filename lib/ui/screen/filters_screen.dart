import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'dart:math';

/// Экран виджет "Фильтр достопримечательностей"
class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  RangeValues _rangeValues;

  @override
  void initState() {
    super.initState();
    _rangeValues = RangeValues(0, 1000);
  }

  String _rangeValuesToStr() {
    String str;
    if (_rangeValues.start < 1000)
      str = 'от ${_rangeValues.start.toStringAsFixed(0)} м до ';
    else
      str = 'от ${(_rangeValues.start / 1000).toStringAsFixed(1)} км до ';
    if (_rangeValues.end < 1000)
      return str + '${_rangeValues.end.toStringAsFixed(0)} м';
    else
      return str + '${(_rangeValues.end / 1000).toStringAsFixed(1)} км';
  }

  bool _distanceInRange(Sight sight) {
    double _currentLat = 47.51984200;
    double _currentLon = 42.20454200;
    double ky = 40000 / 360;
    double kx = cos(pi * _currentLat / 180.0) * ky;
    double dx = (_currentLon - sight.lon).abs() * kx;
    double dy = (_currentLat - sight.lat).abs() * ky;
    double distance = sqrt(dx * dx + dy * dy) * 1000;
    return (distance >= _rangeValues.start) && (distance <= _rangeValues.end);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
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
                    color: Theme.of(context).appBarTheme.textTheme.title.color,
                    colorBlendMode: BlendMode.modulate,
                    fit: BoxFit.fitHeight,
                  ),
                  onPressed: () => print('"<" pressed'),
                ),
              ),
              TextButton(
                onPressed: () => setState(() => sightTypeMocks
                    .forEach((element) => element.isChecked = false)),
                child: Text(
                  "Очистить",
                  style: TextStyle(
                      color: Colors.green,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'КАТЕГОРИИ',
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              GridView.count(
                crossAxisCount: 3,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(sightTypeMocks.length, (index) {
                  return Center(
                    child: _SightTypeWidget(
                      sightType: sightTypeMocks[index],
                      onTap: (SightType sightType) => setState(
                          () => sightType.isChecked = !sightType.isChecked),
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 60.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Расстояние',
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 20,
                      color:
                          Theme.of(context).appBarTheme.textTheme.title.color,
                    ),
                  ),
                  Text(
                    _rangeValuesToStr(),
                    style: TextStyle(
                        color: Colors.grey, fontFamily: "Roboto", fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              RangeSlider(
                  values: _rangeValues,
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey,
                  min: 0,
                  max: 10000,
                  onChanged: (newValues) {
                    setState(() => _rangeValues = newValues);
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: SizedBox(
          height: 48,
          child: RaisedButton(
            onPressed: () => print('"Показать" pressed'),
            color: Colors.green,
            elevation: 0,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Text(
              "Показать (${mocks.where((item) => item.type.isChecked && _distanceInRange(item)).length})",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.normal,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}

class _SightTypeWidget extends StatefulWidget {
  final SightType sightType;
  final ValueChanged<SightType> onTap;

  const _SightTypeWidget({Key key, @required this.sightType, this.onTap})
      : assert(sightType != null),
        assert(onTap != null),
        super(key: key);

  @override
  _SightTypeWidgetState createState() => _SightTypeWidgetState();
}

class _SightTypeWidgetState extends State<_SightTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () => widget.onTap(widget.sightType),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green
                          .withOpacity(widget.sightType.isChecked ? 0.3 : 0.1),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      widget.sightType.image,
                      color: Colors.green,
                      fit: BoxFit.fitWidth,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: widget.sightType.isChecked
                            ? Theme.of(context)
                                .appBarTheme
                                .textTheme
                                .title
                                .color
                            : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'res/Tick.png',
                        color: widget.sightType.isChecked
                            ? Theme.of(context).canvasColor
                            : Colors.transparent,
                        fit: BoxFit.fitWidth,
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.sightType.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 16,
                color: Theme.of(context).appBarTheme.textTheme.title.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
