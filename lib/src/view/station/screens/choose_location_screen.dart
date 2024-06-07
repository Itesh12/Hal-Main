import 'dart:async';
import 'dart:convert';
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/controller/station/state/logistic_service_controller.dart';
import 'package:kisaan_station/src/controller/station/trip_address_state.dart';
// import 'package:latlong2/latlong.dart';
import 'package:map_picker/map_picker.dart';
import 'dart:ui' as ui;

import '../../../infrastructure/repository/station/service/drone_service_repo.dart';

final selectedIndexProvider = StateProvider<int>((ref) {
  return -1;
});

@RoutePage()
class ChooseLogisticLocationPage extends ConsumerStatefulWidget {
  final bool fromAddNewAddress;

  const ChooseLogisticLocationPage({Key? key, this.fromAddNewAddress = true})
      : super(key: key);

  @override
  ConsumerState<ChooseLogisticLocationPage> createState() =>
      _ChooseLocationMapPageState();
}

class _ChooseLocationMapPageState
    extends ConsumerState<ChooseLogisticLocationPage> {
  final _controller = Completer<GoogleMapController>();

  MapPickerController mapPickerController = MapPickerController();
  CameraPosition? cameraPosition;

  @override
  void initState() {
    initCameraPosition();
    super.initState();
  }

  void initCameraPosition() {
    final data = ref.read(currentCoordinateProvider);
    if (data.isNotEmpty) {
      cameraPosition = CameraPosition(
        target: LatLng(data[0], data[1]),
        zoom: 18,
      );
    }
  }

  Future<Uint8List> getBytesFromAsset({required String path,required int width})async {
    final ByteData data = await rootBundle.load(path);
    final ui.Codec codec = await ui.instantiateImageCodec(
        data.buffer.asUint8List(),
        targetWidth: width
    );
    final ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(
        format: ui.ImageByteFormat.png))!
        .buffer.asUint8List();
  }

  TextEditingController textController = TextEditingController();
  String block = 'Press Gps Button for use current Location';
  String? state;
  String? district;
  String? area;
  String? houseNo;
  String? pinCode;

  String? startPlaceId;
  String? dropPlaceId;

  _search(String kw) async {
    final data = await ref.read(googlePlaceProvider).getGooglePlaceTexts(kw);

    setState(() {
      searchResultList = data;
    });
  }

  late List<LocationTextAutocomplete> searchResultList = [];

  final Debouncer _debounce = Debouncer(milliseconds: 400);

  final Set<Marker> _markers = {};

  bool isStartPoint = false;

  late LatLng sourceLatLng;
  late LatLng destinationLatLng;

  late TripLocationData sourceLocationData;
  late TripLocationData destinationLocationData;

  final Set<Polyline> _polylines = <Polyline>{
  };





  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
        title: Text(
          'Trip Location',
          style: TextStyle(color: primary, fontSize: 20.sp),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                MapPicker(
                  // pass icon widget
                  // iconWidget: const Icon(
                  //   Icons.location_on,
                  //   size: 40,
                  //   color: primary,
                  // ),
                  //add map picker controller
                  mapPickerController: mapPickerController,
                  child: GoogleMap(
                    tiltGesturesEnabled: false,
                    myLocationEnabled: false,
                    mapType: MapType.terrain,
                    markers: _markers,
                    polylines: _polylines,


                    // myLocationButtonEnabled: false,

                    // hide location button
                    //  camera position

                    initialCameraPosition: cameraPosition ??
                        const CameraPosition(
                          target: LatLng(12.45678, 12.55555),
                          zoom: 18,
                        ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    onCameraMoveStarted: () {
                      // notify map is moving
                      mapPickerController.mapMoving!();
                      textController.text = "checking ...";

                      block = "checking ...";
                      setState(() {});
                    },
                    onCameraMove: (cameraPosition) {
                      this.cameraPosition = cameraPosition;
                    },
                    onCameraIdle: () async {
                      // notify map stopped moving
                      mapPickerController.mapFinishedMoving!();
                      //get address name from camera position
                      final List<Placemark> placemarks =
                          await placemarkFromCoordinates(
                        cameraPosition?.target.latitude ?? 12.45678,
                        cameraPosition?.target.longitude ?? 12.55555,
                      );

                      block =
                          '${placemarks.first.name}, ${placemarks.first.administrativeArea} ,${placemarks.first.subAdministrativeArea}, ${placemarks.first.locality}, ${placemarks.first.subLocality},${placemarks.first.postalCode}';
                      state = placemarks.first.administrativeArea;
                      district = placemarks.first.subAdministrativeArea;
                      area = placemarks.first.subLocality;
                      houseNo = placemarks.first.name;
                      pinCode = placemarks.first.postalCode;
                      setState(() {});
                      // update the ui with the address
                      textController.text =
                          '${placemarks.first.name}, ${placemarks.first.administrativeArea} ';
                    },
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                      color: whitePrimary,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        onChanged: (kw) {
                          _debounce.run(() => _search(kw));
                          setState(() {
                            isStartPoint = true;
                          });
                        },
                        style: textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                        decoration: InputDecoration(
                            hintText: 'Starting Point',
                            hintStyle: textTheme.bodyLarge!.copyWith(
                                color: hintTextColor, fontSize: 12.sp),
                            isDense: true,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 16.w),
                            fillColor: whitePrimary,
                            border: InputBorder.none),
                      ),
                      TextFormField(
                        onChanged: (kw) {
                          _debounce.run(() => _search(kw));
                        },
                        style: textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                        decoration: InputDecoration(
                            hintText: 'Drop Point',
                            hintStyle: textTheme.bodyLarge!.copyWith(
                                color: hintTextColor, fontSize: 12.sp),
                            isDense: true,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 16.w),
                            fillColor: whitePrimary,
                            border: InputBorder.none),
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () async {
                                final res = await ref
                                    .read(placeIdCoordinateProvider)
                                    .getPlaceIdCoordinates(
                                        searchResultList[index].placeId);
                                final GoogleMapController googleMapController =
                                    await _controller.future;


                                final latlng = LatLng(res.first.lat,res.first.lng);


                                googleMapController.animateCamera(
                                    CameraUpdate.newCameraPosition(
                                        CameraPosition(
                                            zoom: 12.0, target: latlng)));

                                if (isStartPoint) {
                                  sourceLatLng = latlng;
                                  _markers.add(Marker(
                                      markerId: const MarkerId('source'),
                                      position: sourceLatLng));

                                  ref.read(tripStartLocationProvider.notifier).state = res[index];
                                } else {
                                  destinationLatLng = latlng;
                                  ref.read(tripDropLocationProvider.notifier).state = res[index];
                                  final List<LatLng> points = [];
                                  _markers.add(Marker(
                                      markerId: const MarkerId('destination'),
                                      position: destinationLatLng));

                                  final polyLinePoints = await PolylinePoints()
                                      .getRouteBetweenCoordinates(
                                          'AIzaSyC6pbtcBe5CI5MtcE8ZVN7MEWgj4Cj6IqM',
                                          PointLatLng(sourceLatLng.latitude,
                                              sourceLatLng.longitude),
                                          PointLatLng(
                                              destinationLatLng.latitude,
                                              destinationLatLng.longitude));

                                  for (final element in polyLinePoints.points) {
                                    points.add(LatLng(
                                        element.latitude, element.longitude));
                                  }

                                  _polylines.clear();
                                  setState(() {
                                    _polylines.add(Polyline(
                                      startCap: Cap.roundCap,
                                        endCap:Cap.roundCap,
                                        polylineId: const PolylineId('Route'),
                                        points: points,
                                        color: deepOrange,
                                        width: 3));
                                  });

                                  print(points);
                                }

                                print(_polylines.length);

                                searchResultList.clear();
                                isStartPoint = false;

                                setState(() {});
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 5.h),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: primary,
                                    ),
                                    10.horizontalSpace,
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            searchResultList[index].mainText,
                                            style: const TextStyle(
                                                color: black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            searchResultList[index]
                                                .secondaryText,
                                            style: const TextStyle(
                                                color: black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(
                                color: lightOrange,
                              ),
                          itemCount: searchResultList.length)
                    ],
                  ),
                )
                // ElevatedButton(
                //   onPressed: () {
                //     initCameraPosition();
                //   },
                //   child: Text('Get current Location'),
                // ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: (){

          context.router.pop();


        },
        child: const Text('Continue'),
      ),
    );
  }
}

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
