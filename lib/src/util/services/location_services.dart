import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:location/location.dart';

class LocationService {
  late Location _location;
  bool _serviceEnabled = false;
  PermissionStatus? _grantedPermission;

  LocationService() {
    _location = Location();
  }

  Future<bool> _checkPermission() async {
    _grantedPermission = await _location.hasPermission();
    if (_grantedPermission == PermissionStatus.denied) {
      _grantedPermission = await _location.requestPermission();
    }

    return _grantedPermission == PermissionStatus.granted;
  }

  Future<bool> _checkService() async {
    if (await _checkPermission()) {
      try {
        _serviceEnabled = await _location.serviceEnabled();
        if (!_serviceEnabled) {
          _serviceEnabled = await _location.requestService();
        }
      } on PlatformException catch (error) {
        debugPrint(
            'error code is ${error.code} and message = ${error.message}');
        _serviceEnabled = false;
        await _checkService();
      }
    }

    return _serviceEnabled;
  }

  Future<bool> checkLocation() async {
    if ((await _location.hasPermission()) == PermissionStatus.granted) {
      return _location.serviceEnabled();
    } else {
      return false;
    }
  }

  Future<LocationData?> getLocation() async {
    if (await _checkService()) {
      final locationData = _location.getLocation();
      return locationData;
    }

    return null;
  }

  Future<geo.Placemark?> getPlaceMark(
      {required LocationData locationData}) async {

    final List<geo.Placemark> placeMarks = await geo.placemarkFromCoordinates(
        locationData.latitude!, locationData.longitude!);
    if (placeMarks.isNotEmpty) {
      return placeMarks[0];
    }

    return null;
  }

  Future<String?> getShortAddress({
    required double latitude,
    required double longitude,
  }) async {
    final List<geo.Placemark> placeMarks =
        await geo.placemarkFromCoordinates(latitude, longitude);
    if (placeMarks.isNotEmpty) {
      final geo.Placemark place = placeMarks[0];

      final String subAd = place.subAdministrativeArea!.isNotEmpty
          ? "${place.subAdministrativeArea},"
          : "";

      final String address = "$subAd ${place.administrativeArea}";

      debugPrint(address);

      return address;
    } else {
      return null;
    }
  }

  Future<String?> getFullAddress({
    required double latitude,
    required double longitude,
  }) async {
    final List<geo.Placemark> placeMarks =
        await geo.placemarkFromCoordinates(latitude, longitude);
    if (placeMarks.isNotEmpty) {
      final geo.Placemark place = placeMarks[0];

      final String subAd = place.subAdministrativeArea!.isNotEmpty
          ? "${place.subAdministrativeArea},"
          : "";

      final String local =
          place.locality!.isNotEmpty ? "${place.locality}," : "";

      final String subLocal =
          place.subLocality!.isNotEmpty ? "${place.subLocality}," : "";

      final String street = place.street!.isNotEmpty ? "${place.street}," : "";

      final String address =
          "$street $subLocal $local $subAd ${place.administrativeArea}";

      debugPrint(address);

      return address;
    } else {
      return null;
    }
  }
}
