/// Класс типа достопримечательности
class SightType {
  String name;
  String image;
  bool isChecked;

  SightType({this.name, this.image, this.isChecked = false});
}

/// Перечисление состояние достопримечательности
enum SightState {
  unknown,
  scheduled,
  visited,
}

/// Класс достопримечательности
class Sight {
  String name;
  double lat;
  double lon;
  String url;
  String details;
  SightType type;
  String scheduled;
  String info;
  SightState state;

  Sight({
    this.name,
    this.lat,
    this.lon,
    this.url,
    this.details,
    this.type,
    this.scheduled,
    this.info,
    this.state = SightState.unknown,
  });
}
