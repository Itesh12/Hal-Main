// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherResponseModelImpl _$$WeatherResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WeatherResponseModelImpl(
      date: json['date'] as String?,
      location: (json['location'] as num?)?.toDouble(),
      tempMin: (json['tempMin'] as num?)?.toDouble(),
      tempMax: (json['tempMax'] as num?)?.toDouble(),
      pressure: json['pressure'] as int?,
      humidity: json['humidity'] as int?,
    );

Map<String, dynamic> _$$WeatherResponseModelImplToJson(
        _$WeatherResponseModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'location': instance.location,
      'tempMin': instance.tempMin,
      'tempMax': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
