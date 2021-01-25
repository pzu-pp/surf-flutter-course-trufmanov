import 'package:flutter/material.dart';

class SightImage extends StatelessWidget {
  final String url;

  const SightImage(this.url, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
       width: double.infinity,
       fit: BoxFit.fitWidth,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
