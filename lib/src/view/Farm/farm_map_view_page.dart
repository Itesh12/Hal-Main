import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/model/farm/farm_entity.dart';
import 'package:map_picker/map_picker.dart';

import '../../../global_providers.dart';
import '../../util/services/shared_preferences.dart';

@RoutePage()
class FarmMapViewPage extends ConsumerStatefulWidget {
  const FarmMapViewPage({super.key, required this.farmDetails});

  final FarmDetails farmDetails;

  @override
  ConsumerState<FarmMapViewPage> createState() => _FarmMapViewPageState();
}

class _FarmMapViewPageState extends ConsumerState<FarmMapViewPage> {
  final Set<Polygon> polygons = {};
  final Set<Marker> markers = {};
  final List<LatLng> currentTappedPoints = [];

  final MapPickerController mapPickerController = MapPickerController();
  late CameraPosition cameraPosition;

  int lineCounter = 1;
  int polyGonCounter = 1;

  void addPolyGonToShow() {
    if (currentTappedPoints.isEmpty) {
      currentTappedPoints.clear();
      widget.farmDetails.plot?.coordinates.forEach((element) {
        currentTappedPoints.add(LatLng(element.lat, element.lng));
      });
    }
    polygons.clear();
    polygons.add(Polygon(
      polygonId: PolygonId(UserPreferences.userId),
      strokeWidth: 3,
      geodesic: true,
      fillColor: orange400.withOpacity(0.7),
      strokeColor: Colors.orange,
      points: currentTappedPoints,
    ));

    if (widget.farmDetails.plot != null) {
      if (widget.farmDetails.plot!.centroid != null) {
        final centroid = LatLng(widget.farmDetails.plot!.centroid!.lat,
            widget.farmDetails.plot!.centroid!.lng);

        markers.add(
            Marker(markerId: const MarkerId('Centroid'), position: centroid));
      }
    }
  }

  addMarker(List<double> latLng){
    markers.add(
        Marker(markerId: const MarkerId('Centroid'), position: LatLng(latLng.first, latLng.last)));
  }

  void _initCameraPosition() {
    final data = ref.read(currentCoordinateProvider);
    if (data.isNotEmpty) {

      final lat = double.parse(data[0].toStringAsFixed(7));
      final long = double.parse(data[1].toStringAsFixed(7));
      cameraPosition = CameraPosition(
        target: LatLng(lat, long),
        zoom: 18,
      );
    }
  }

  @override
  void initState() {
    _initCameraPosition();
   if(widget.farmDetails.plot != null){
     addPolyGonToShow();
   }
   else {
     addMarker(widget.farmDetails.location.coordinates);
   }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.farmDetails.farmName,
          style: TextStyle(
              color: primary, fontSize: 20.sp, fontWeight: FontWeight.w500),
        ),
      ),
      body: MapPicker(
          mapPickerController: mapPickerController,
          child: GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: cameraPosition,
            markers: markers,
            polygons: polygons,
          )),
    );
  }
}
