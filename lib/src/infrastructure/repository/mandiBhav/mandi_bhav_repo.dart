import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../global_providers.dart';
import '../../../model/mandiBhav/mandi_bhav_model.dart';
import '../../http/api_provider.dart';

class MandiBhavRepository {
  MandiBhavRepository(this.ref);

  final Ref ref;

  final String apikey =
      '579b464db66ec23bdd000001cd4a2c632158466178c1a8f8cd5a451f';

  Future<MandiBhavModel> getMandiBhavbyState(String state) async {
    late MandiBhavModel mandiBhav;
    final location = await ref.read(locationProvider).getLocation();
    final double? lat = location?.latitude;
    final double? lon = location?.longitude;

    if (location != null) {
      final res = await ref.read(apiProvider).get(
            '/resource/9ef84268-d588-465a-a308-a864a43d0070?api-key=$apikey&format=json&filters[state]=$state&limit=999',
            newBaseUrl: "https://api.data.gov.in",
          );
      res.when(
        success: (source) {
          mandiBhav = MandiBhavModel.fromJson(source);
          debugPrint(source.toString());


          debugPrint(mandiBhav.toString());
        },
        error: (error) {
          throw error;
        },
      );
    }

    return mandiBhav;

    // final res = await ref.read(apiProvider).get("assets/emprecord.json",newBaseUrl: "assets/emprecord.json",);
    // https://api.openweathermap.org/data/2.5/forecast?lat=57&lon=-2.15&cnt=3&appid={API key}
    // api.openweathermap.org/data/2.5/forecast/daily?lat={lat}&lon={lon}&cnt={cnt}&appid={API key}
    // '/data/2.5/forecast?lat=28.5355&lon=77.3910&cnt=3&appid=$APIkey'
  }

  Future<MandiBhavModel> getWeatherDataByMarket(String market) async {
    late MandiBhavModel mandiBhav;
    final location = await ref.read(locationProvider).getLocation();
    final double? lat = location?.latitude;
    final double? lon = location?.longitude;

    if (location != null) {
      final res = await ref.read(apiProvider).get(
            '/resource/9ef84268-d588-465a-a308-a864a43d0070?api-key=$apikey&format=json&filters[market]=$market&limit=999',
            newBaseUrl: "https://api.data.gov.in",
          );
      res.when(
        success: (source) {
          mandiBhav = MandiBhavModel.fromJson(source);
          debugPrint(source.toString());


          debugPrint(mandiBhav.toString());
        },
        error: (error) {
          throw error;
        },
      );
    }

    return mandiBhav;

    // final res = await ref.read(apiProvider).get("assets/emprecord.json",newBaseUrl: "assets/emprecord.json",);
    // https://api.openweathermap.org/data/2.5/forecast?lat=57&lon=-2.15&cnt=3&appid={API key}
    // api.openweathermap.org/data/2.5/forecast/daily?lat={lat}&lon={lon}&cnt={cnt}&appid={API key}
    // '/data/2.5/forecast?lat=28.5355&lon=77.3910&cnt=3&appid=$APIkey'
  }
}
