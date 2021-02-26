import 'dart:math';
import 'package:places/mocks.dart';

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
  String scheduled = '';
  String info = 'Открыто';
  SightState state = SightState.unknown;

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

  bool distanceInRange() {
    double _currentLat = 47.51984200;
    double _currentLon = 42.20454200;
    double ky = 40000 / 360;
    double kx = cos(pi * _currentLat / 180.0) * ky;
    double dx = (_currentLon - lon).abs() * kx;
    double dy = (_currentLat - lat).abs() * ky;
    double distance = sqrt(dx * dx + dy * dy) * 1000;
    return (distance >= distanceRangeValuesMocks.start) && (distance <= distanceRangeValuesMocks.end);
  }

}
