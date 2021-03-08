import 'package:flutter/material.dart';
import 'package:places/ui/widgets/sight_card.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';

/// Класс виджета перемещаемой карточки отдельной достопримечательности
class DraggableSightCard extends StatefulWidget {
  final Sight sight;
  final SightCardType cardType;
  final ValueChanged<Sight> onDelete;
  final VoidCallback onChange;

  const DraggableSightCard(
      {Key key,
      @required this.sight,
      this.cardType = SightCardType.simple,
      @required this.onDelete,
      @required this.onChange})
      : assert(sight != null),
        assert(onDelete != null),
        assert(onChange != null),
        super(key: key);

  @override
  _DraggableSightCardState createState() => _DraggableSightCardState();
}

/// Состояние виджета перемещаемой карточки отдельной достопримечательности
class _DraggableSightCardState extends State<DraggableSightCard> {
  bool _isDrag = false;

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable<Sight>(
      data: widget.sight,
      onDragStarted: () => setState(() => _isDrag = true),
      onDragEnd: (data) => setState(() => _isDrag = false),
      feedback: SightCard(
        sight: widget.sight,
        cardType: widget.cardType,
        onDelete: widget.onDelete,
      ),
      child: _isDrag
          ? SightCard(
              sight: widget.sight,
              cardType: widget.cardType,
              onDelete: widget.onDelete,
            )
          : DragTarget<Sight>(
              onWillAccept: (data) => true,
              onAccept: (data) {
                int dragId = mocks.indexOf(data);
                int targetId = mocks.indexOf(widget.sight);
                mocks.removeAt(dragId);
                mocks.insert(targetId, data);
                widget.onChange();
              },
              builder: (context, candidateData, rejectedData) => SightCard(
                sight: widget.sight,
                cardType: widget.cardType,
                onDelete: widget.onDelete,
              ),
            ),
    );
  }
}
