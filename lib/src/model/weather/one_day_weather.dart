// To parse this JSON data, do
//
//     final oneDayWeather = oneDayWeatherFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'one_day_weather.freezed.dart';
part 'one_day_weather.g.dart';

OneDayWeatherModel oneDayWeatherFromJson(String str) =>
    OneDayWeatherModel.fromJson(json.decode(str));

String oneDayWeatherToJson(OneDayWeatherModel data) =>
    json.encode(data.toJson());

@freezed
abstract class OneDayWeatherModel with _$OneDayWeatherModel {
  const factory OneDayWeatherModel({
    required Main main,
    int? visibility,
    List<Weather>? weather,
    Wind? wind,
    Clouds? clouds,
    int? timezone,
    String? name,
  }) = _OneDayWeather;

  factory OneDayWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$OneDayWeatherModelFromJson(json);
}

@freezed
abstract class Clouds with _$Clouds {
  const factory Clouds({
    required int all,
  }) = _Clouds;

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}

@freezed
abstract class Main with _$Main {
  const factory Main({
    required double temp,
    double? feels_like,
    double? temp_min,
    double? temp_max,
    int? pressure,
    int? humidity,
  }) = _Main;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@freezed
abstract class Weather with _$Weather {
  const factory Weather({
    String? main,
    String? description,
    String? icon,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@freezed
abstract class Wind with _$Wind {
  const factory Wind({
    double? speed,
    int? deg,
  }) = _Wind;

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}
