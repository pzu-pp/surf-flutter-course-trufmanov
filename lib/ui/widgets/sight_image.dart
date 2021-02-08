import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

/// Класс виджета - загружаемая по указанному URL-у картинка с индикацией
/// процесса загрузки.
class SightImage extends StatelessWidget {
  final String url;

  /// Конструктор.
  /// url - строка, URL ресурса (фотографии), обязательный параметр.
  ///  const SightImage(this.url, {Key key}) : super(key: key);
  const SightImage({Key key, @required this.url})
      : assert(url != null),
        assert(url != ''),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: double.infinity,
      fit: BoxFit.fitWidth,
      loadingBuilder: (context, child, loadingProgress) {
        return loadingProgress == null
            ? child
            : Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes
                      : null,
                ),
              );
      },
    );
  }
}
