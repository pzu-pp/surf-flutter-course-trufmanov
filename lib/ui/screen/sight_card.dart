import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  const SightCard({Key key, @required this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.cyan,
                ),
              ),
              Positioned(
                top: 16,
                left: 16,
                child: Text(
                  sight.type,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
              Positioned(
                top: 18,
                right: 19,
                child: Container(
                  color: Colors.white,
                  height: 18,
                  width: 20,
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Text(
            sight.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          SizedBox(height: 2),
          Expanded(
            // child: FractionallySizedBox(
            //   widthFactor: 0.5,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 2),
              child: Text(
                sight.details,
                // maxLines: 3,
                // overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color(0xFF7C7E92),
                    fontFamily: "Roboto",
                    fontSize: 14),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
