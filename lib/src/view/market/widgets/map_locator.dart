import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
// import 'package:latlong2/latlong.dart';
import 'package:map_picker/map_picker.dart';

import '../../../app/router/router.gr.dart';
import '../../../infrastructure/repository/station/service/drone_service_repo.dart';
import '../../station/screens/choose_location_screen.dart';

@RoutePage()
class MapPage extends ConsumerStatefulWidget {
  final bool fromAddNewAddress;

  const MapPage({Key? key, this.fromAddNewAddress = true}) : super(key: key);

  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> {
  // static final LatLng _lastMapPosition = _kinitialPosition;
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

  _search(String kw) async {
    final data = await ref.read(googlePlaceProvider).getGooglePlaceTexts(kw);

    setState(() {
      searchResultList = data;
    });
  }

  late List<LocationTextAutocomplete> searchResultList = [];

  final Debouncer _debounce = Debouncer(milliseconds: 400);

  TextEditingController textController = TextEditingController();
  String block = 'Press Gps Button for use current Location';
  String? state;
  String? district;
  String? area;
  String? houseNo;
  String? pinCode;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
        title: const Text("Choose location"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                MapPicker(
                  // pass icon widget
                  iconWidget: const Icon(
                    Icons.location_on,
                    size: 40,
                    color: primary,
                  ),
                  //add map picker controller
                  mapPickerController: mapPickerController,
                  child: GoogleMap(
                    tiltGesturesEnabled: false,
                    mapType: MapType.hybrid,
                    myLocationEnabled: true,
                    padding: EdgeInsets.only(top: 60.h),
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                      color: whitePrimary,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10.r),
                          bottomLeft: Radius.circular(10.r))),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          onChanged: (kw) {
                            _debounce.run(() => _search(kw));
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


                                  searchResultList.clear();

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
                            separatorBuilder: (context, index) => Divider(
                              color: lightOrange,
                            ),
                            itemCount: searchResultList.length)
                      ],
                    ),
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
          10.verticalSpace,
          Padding(
            padding: pagePadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 30,
                      color: primary,
                    ),
                    SizedBox(
                        width: 300.w,
                        child: Text(
                          block,
                          style:
                              TextStyle(fontSize: 20.sp, color: Colors.black),
                        ))
                  ],
                ),
                10.verticalSpace,
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: widget.fromAddNewAddress
                        ? () {
                            context.router.push(AddNewAddressRoute(
                                state: state,
                                district: district,
                                area: area,
                                houseNo: houseNo,
                                pinCode: pinCode,
                                lat: cameraPosition!.target.latitude,
                                long: cameraPosition!.target.longitude));
                            debugPrint(
                                "Location ${cameraPosition!.target.latitude} ${cameraPosition!.target.longitude}");
                            debugPrint("Address: ${textController.text}");
                          }
                        : () {
                            context.router.push(AddAddressStationPartnerRoute(
                                state: state,
                                district: district,
                                area: area,
                                houseNo: houseNo,
                                pinCode: pinCode,
                                lat: cameraPosition!.target.latitude,
                                long: cameraPosition!.target.longitude));
                          },
                    child: const Text('Proceeed'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
