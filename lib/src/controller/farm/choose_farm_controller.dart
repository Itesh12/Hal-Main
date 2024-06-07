import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_picker/map_picker.dart';

import '../../../global_providers.dart';
import '../../constants/colors.dart';
import '../../model/farm/farm_entity.dart';
import '../../util/services/shared_preferences.dart';
import '../../view/station/screens/choose_farm_location.dart';

final polyGonCoordinatesProvider = StateProvider<List<LatLng>>((ref) => []);

class ChooseFarmLocationNotifier extends ChangeNotifier {
  ChooseFarmLocationNotifier(this.ref) {
    _initCameraPosition();
  }

  final Ref ref;

  final Completer<GoogleMapController> completer =
      Completer<GoogleMapController>();

  final MapPickerController mapPickerController = MapPickerController();

  late CameraPosition cameraPosition;

  bool showFirstMarker = true;
  bool showInitialPolygon = true;

  final Set<Polygon> polygons = {};
  final Set<Polyline> polyLines = {};
  final Set<Marker> markers = {};
  final List<LatLng> currentTappedPoints = [];
  int lineCounter = 1;
  int polyGonCounter = 1;

  void _initCameraPosition() {
    final data = ref.read(currentCoordinateProvider);
    if (data.isNotEmpty) {
      cameraPosition = CameraPosition(
        target: LatLng(data[0], data[1]),
        zoom: 18,
      );
    }
  }

  Future<void> myLocation() async {
    final data = ref.read(currentCoordinateProvider);
    final GoogleMapController googleMapController = await completer.future;
    if (data.isNotEmpty) {
      cameraPosition = CameraPosition(
        target: LatLng(data[0], data[1]),
        zoom: 18,
      );

      googleMapController
          .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    }
  }

  void addPolyGon() {
    if (polyLines.length >= 3) {
      polygons.clear();
      notifyListeners();
      polygons.add(Polygon(
        polygonId: PolygonId(UserPreferences.userId),
        strokeWidth: 3,
        geodesic: true,
        fillColor: orange400.withOpacity(0.7),
        strokeColor: Colors.orange,
        points: currentTappedPoints,
      ));
      notifyListeners();
      polyLines.clear();
    }
  }

  void addPolyGonToShow(List<Point> polyGonList){
    if(showInitialPolygon && polyGonList.isNotEmpty){
      final List<LatLng> polyGonLatlng = [];
      for (final element in polyGonList) {
        polyGonLatlng.add(LatLng(element.lat, element.lng));
      }
      polygons.clear();
      polygons.add(Polygon(
        polygonId: PolygonId("initial"),
        strokeWidth: 3,
        geodesic: true,
        fillColor: orange400.withOpacity(0.7),
        strokeColor: Colors.orange,
        points: polyGonLatlng,
      ));
    }
  }


  Future<void> addLatLng(LatLng latLng) async {
    final Uint8List? markerIcon =
        await getBytesFromAsset('assets/images/start-elipse.png', 20);
    currentTappedPoints.add(latLng);
    polyLines.add(Polyline(
        jointType: JointType.round,
        endCap: Cap.roundCap,
        startCap: Cap.roundCap,
        polylineId: PolylineId((lineCounter++).toString()),
        color: Colors.orange,
        width: 2,
        points: currentTappedPoints));
    markers.add(Marker(
        icon: BitmapDescriptor.fromBytes(markerIcon!),
        position: latLng,
        markerId: MarkerId(lineCounter.toString())));

    if (markers.length == 2 && showFirstMarker) {
      markers.remove(markers.first);
      showFirstMarker = false;
    }
    notifyListeners();
  }

  Future<void> zoomIn() async {
    final GoogleMapController googleMapController = await completer.future;

    googleMapController.animateCamera(CameraUpdate.zoomIn());
  }

  Future<void> zoomOut() async {
    final GoogleMapController googleMapController = await completer.future;
    googleMapController.animateCamera(CameraUpdate.zoomOut());
  }

  void deletePolyGon() {
    polygons.clear();
    polyLines.clear();
    markers.clear();
    currentTappedPoints.clear();
    showFirstMarker = true;
    showInitialPolygon = false;
    notifyListeners();
  }
}
