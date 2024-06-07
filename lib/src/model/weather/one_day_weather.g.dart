// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_day_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OneDayWeatherImpl _$$OneDayWeatherImplFromJson(Map<String, dynamic> json) =>
    _$OneDayWeatherImpl(
      main: Main.fromJson(json['main'] as Map<String, dynamic>),
      visibility: json['visibility'] as int?,
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      wind: json['wind'] == null
          ? null
          : Wind.fromJson(json['wind'] as Map<String, dynamic>),
      clouds: json['clouds'] == null
          ? null
          : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
      timezone: json['timezone'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$OneDayWeatherImplToJson(_$OneDayWeatherImpl instance) =>
    <String, dynamic>{
      'main': instance.main,
      'visibility': instance.visibility,
      'weather': instance.weather,
      'wind': instance.wind,
      'clouds': instance.clouds,
      'timezone': instance.timezone,
      'name': instance.name,
    };

_$CloudsImpl _$$CloudsImplFromJson(Map<String, dynamic> json) => _$CloudsImpl(
      all: json['all'] as int,
    );

Map<String, dynamic> _$$CloudsImplToJson(_$CloudsImpl instance) =>
    <String, dynamic>{
      'all': instance.all,
    };

_$MainImpl _$$MainImplFromJson(Map<String, dynamic> json) => _$MainImpl(
      temp: (json['temp'] as num).toDouble(),
      feels_like: (json['feels_like'] as num?)?.toDouble(),
      temp_min: (json['temp_min'] as num?)?.toDouble(),
      temp_max: (json['temp_max'] as num?)?.toDouble(),
      pressure: json['pressure'] as int?,
      humidity: json['humidity'] as int?,
    );

Map<String, dynamic> _$$MainImplToJson(_$MainImpl instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feels_like,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    _$WeatherImpl(
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

_$WindImpl _$$WindImplFromJson(Map<String, dynamic> json) => _$WindImpl(
      speed: (json['speed'] as num?)?.toDouble(),
      deg: json['deg'] as int?,
    );

Map<String, dynamic> _$$WindImplToJson(_$WindImpl instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
    };
