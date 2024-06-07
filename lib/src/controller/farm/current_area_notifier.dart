import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';

class CurrentAreaNotifier extends StateNotifier<AsyncValue<Placemark>> {
  CurrentAreaNotifier() : super(const AsyncValue.loading());

  // Ref ref;

  Future<void> initArea(double latitude, double longitude) async {
    debugPrint("lat: $latitude, long: $longitude");
    try {
      debugPrint("trying to fetch address.............................");

      final List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );
      // ref.read(locationProvider).getPlaceMark(locationData: locationData);
      debugPrint("place: ${placemarks[0]}");

      debugPrint(
          "changing locaion...............................................");
      state = AsyncValue.data(placemarks[0]);
      debugPrint(
          "changed locaion.$state..............................................");
    } catch (e) {
      debugPrint("error while fetching address.............................");
      // state = AsyncValue.error(e);
    }
  }
}
