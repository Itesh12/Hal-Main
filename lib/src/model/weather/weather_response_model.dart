import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_response_model.freezed.dart';
part 'weather_response_model.g.dart';

@freezed
class WeatherResponseModel with _$WeatherResponseModel {
  const factory WeatherResponseModel({
    String? date,
    double? location,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
  }) = _WeatherResponseModel;

  const WeatherResponseModel._();

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseModelFromJson(json);
}
