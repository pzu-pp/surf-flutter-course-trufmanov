import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';

/// Экран выбора типа достопримечательности
class SelectSightTypeScreen extends StatefulWidget {
  SightType sightType;

  SelectSightTypeScreen({
    Key key,
    @required this.sightType,
  }) : super(key: key);

  @override
  _SelectSightTypeScreenState createState() => _SelectSightTypeScreenState();
}

class _SelectSightTypeScreenState extends State<SelectSightTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Категория'),
        leading: TextButton(
          child: Image.asset(
            'res/Arrow.png',
            height: 30,
            color:
            Theme.of(context).appBarTheme.textTheme.title.color,
            colorBlendMode: BlendMode.modulate,
            fit: BoxFit.fitHeight,
          ),
          onPressed: () => Navigator.of(context).pop(widget.sightType),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: sightTypeMocks
                .map((item) => _SightTypeListItem(
                      value: item,
                      selected: item == widget.sightType,
                      onChanged: (value) =>
                          setState(() => widget.sightType = value),
                    ))
                .toList(),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: SizedBox(
          height: 48,
          child: RaisedButton(
            onPressed: widget.sightType != null
                ? () => Navigator.of(context).pop(widget.sightType)
                : null,
            color: Colors.green,
            elevation: 0,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Text(
              'СОХРАНИТЬ',
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

class _SightTypeListItem extends StatefulWidget {
  final SightType value;
  final bool selected;
  final ValueChanged<SightType> onChanged;

  const _SightTypeListItem({
    Key key,
    @required this.value,
    @required this.selected,
    @required this.onChanged,
  })  : assert(value != null),
        assert(selected != null),
        super(key: key);

  @override
  _SightTypeListItemState createState() => _SightTypeListItemState();
}

class _SightTypeListItemState extends State<_SightTypeListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => widget.onChanged(widget.value),
          child: Padding(
            padding: const EdgeInsets.only(top: 14, bottom: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.value.name,
                  style: TextStyle(
                    color: Theme.of(context)
                        .appBarTheme
                        .textTheme
                        .title
                        .color,
                    fontSize: 20,
                  ),
                ),
                Icon(
                  Icons.done,
                  color: widget.selected ? Colors.green : Colors.transparent,
                ),
              ],
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
