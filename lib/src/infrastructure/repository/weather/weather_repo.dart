import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../global_providers.dart';
import '../../../model/weather/one_day_weather.dart';
import '../../http/api_provider.dart';

class WeatherDataRepository {
  WeatherDataRepository(this.ref);

  final Ref ref;

  final String apikey = 'bdd40565281518c2d19dc66342e3b69d';

  Future<OneDayWeatherModel> getWeatherData() async {
    late OneDayWeatherModel weatherData;
    final location = await ref.read(locationProvider).getLocation();
    final double? lat = location?.latitude;
    final double? lon = location?.longitude;

    if (location != null) {
      final res = await ref.read(apiProvider).get(
            '/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=$apikey',
            newBaseUrl: "https://api.openweathermap.org",
          );
      res.when(
        success: (source) {
          weatherData = OneDayWeatherModel.fromJson(source);
          debugPrint(source.toString());


          debugPrint(weatherData.toString());
        },
        error: (error) {
          throw error;
        },
      );
    }

    return weatherData;

    // final res = await ref.read(apiProvider).get("assets/emprecord.json",newBaseUrl: "assets/emprecord.json",);
    // https://api.openweathermap.org/data/2.5/forecast?lat=57&lon=-2.15&cnt=3&appid={API key}
    // api.openweathermap.org/data/2.5/forecast/daily?lat={lat}&lon={lon}&cnt={cnt}&appid={API key}
    // '/data/2.5/forecast?lat=28.5355&lon=77.3910&cnt=3&appid=$APIkey'
  }
}
