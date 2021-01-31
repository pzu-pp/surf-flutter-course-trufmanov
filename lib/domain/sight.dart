/// Перечисление состояние достопримечательности
enum SightState{
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
  String type;
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
