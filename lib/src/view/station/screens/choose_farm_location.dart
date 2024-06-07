import 'dart:async';
import 'dart:ui' as ui;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kisaan_station/src/controller/farm/choose_farm_controller.dart';
import 'package:kisaan_station/src/model/farm/farm_entity.dart';
import 'package:map_picker/map_picker.dart';

import '../../../../global_providers.dart';
import '../../../app/router/router.gr.dart';
import '../../../constants/colors.dart';
import '../../../constants/page_padding.dart';
import '../../../infrastructure/repository/station/service/drone_service_repo.dart';
import 'choose_location_screen.dart';

@RoutePage()
class ChooseFarmLocationPage extends ConsumerStatefulWidget {
  const ChooseFarmLocationPage({this.polyGonList = const []});


  final List<Point> polyGonList;

  @override
  ConsumerState<ChooseFarmLocationPage> createState() =>
      _ChooseFarmLocationPageState();
}

class _ChooseFarmLocationPageState
    extends ConsumerState<ChooseFarmLocationPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> searchPlaces(String kw) async {
    final data = await ref.read(googlePlaceProvider).getGooglePlaceTexts(kw);

    setState(() {
      searchResultList = data;
    });
  }


  polygonDialog() async {
    await Future.delayed(const Duration(microseconds: 600));
    showDialog(context: context, builder: (context){
      return Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            20.verticalSpace,
            Text('Draw Farm Boundary',style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20.sp),),
            10.verticalSpace,
            SizedBox(
              height: MediaQuery.of(context).size.height*0.28,
                width: MediaQuery.of(context).size.width*0.6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset('assets/images/polygon.gif',fit: BoxFit.cover,))),
            30.verticalSpace,
            ElevatedButton(onPressed: (){
              context.router.pop();
            } , child: const Text('Ok')),
            20.verticalSpace
          ],
        ),
      );
    });
  }

  late List<LocationTextAutocomplete> searchResultList = [];

  final Debouncer _debounce = Debouncer(milliseconds: 400);

  String block = 'Press Gps Button for use current Location';
  String? state;
  String? district;
  String? area;
  String? houseNo;
  String? pinCode;

  LatLng? latlng;

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final res = ref.watch(farmLocationProvider);
    final mapPickerController = res.mapPickerController;
    var _cameraPosition = res.cameraPosition;
    final _controller = res.completer;
    res.addPolyGonToShow(widget.polyGonList);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.router.pop();
          },
        ),
        title: Text(
          'Choose Farm Location',
          style: TextStyle(
              fontSize: 20.sp, fontWeight: FontWeight.w500, color: primary),
        ),
      ),
      body: MapPicker(
        showDot: false,
        iconWidget: SizedBox(
            height: 40.h,
            width: 30.h,
            child: !focusNode.hasFocus ? res.markers.isEmpty
                ? const Icon(
                    Icons.location_on,
                    color: Colors.redAccent,
                    size: 40,
                  )
                : null : null),
        mapPickerController: mapPickerController,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  GoogleMap(
                    compassEnabled: false,
                    mapToolbarEnabled: false,
                    onTap: (latLng) {
                      res.addLatLng(latLng);
                    },
                    polygons: res.polygons,
                    polylines: res.polyLines,
                    markers: res.markers,
                    mapType: MapType.satellite,
                    zoomGesturesEnabled: false,
                    zoomControlsEnabled: false,
                    initialCameraPosition: _cameraPosition,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    onCameraMoveStarted: () {
                      mapPickerController.mapMoving!();
                      block = "checking ...";
                      setState(() {});
                    },
                    onCameraMove: (cameraPosition) {
                      _cameraPosition = cameraPosition;

                      latlng = cameraPosition.target;
                    },
                    onCameraIdle: () async{
                      mapPickerController.mapFinishedMoving!();
                      final List<Placemark> placeMarks =
                          await placemarkFromCoordinates(
                        _cameraPosition.target.latitude,
                        _cameraPosition.target.longitude,
                      );

                      block =
                      '${placeMarks.first.name}, ${placeMarks.first.administrativeArea} ,${placeMarks.first.subAdministrativeArea}, ${placeMarks.first.locality}, ${placeMarks.first.subLocality},${placeMarks.first.postalCode}';
                      state = placeMarks.first.administrativeArea;
                      district = placeMarks.first.subAdministrativeArea;
                      area = placeMarks.first.subLocality;
                      houseNo = placeMarks.first.name;
                      pinCode = placeMarks.first.postalCode;
                      setState(() {});
                    },
                  ),
                  Positioned(
                    right: 12,
                    top: 12,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            MapOverlayButtons(
                              iconData: Icons.my_location,
                              onTap: () {
                                res.myLocation();
                              },
                            ),
                            10.verticalSpace,
                            MapOverlayButtons(
                                iconData: Icons.delete_outline_outlined,
                                onTap: () {
                                  res.deletePolyGon();
                                }),
                            10.verticalSpace,
                            MapOverlayButtons(
                                iconData: Icons.check,
                                onTap: () {
                                  res.addPolyGon();
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 12,
                    bottom: 12,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            MapOverlayButtons(
                                iconData: Icons.zoom_in,
                                onTap: () {
                                  res.zoomIn();
                                }),
                            10.verticalSpace,
                            MapOverlayButtons(
                                iconData: Icons.zoom_out,
                                onTap: () {
                                  res.zoomOut();
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    margin: EdgeInsets.only(
                        top: 10.h, bottom: 10.h, right: 55.w, left: 10.w),
                    decoration: BoxDecoration(
                        color: whitePrimary,
                        borderRadius: BorderRadius.circular(10)),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            focusNode: focusNode,
                            onChanged: (kw) {
                              _debounce.run(() => searchPlaces(kw));
                            },
                            style:
                                textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                            decoration: InputDecoration(
                                hintText: 'Search Area, Locality',
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

                                    setState(() {
                                      block = res.first.address;
                                      searchResultList.clear();
                                    });
                                    final GoogleMapController
                                        googleMapController =
                                        await _controller.future;


                                    googleMapController.animateCamera(
                                        CameraUpdate.newCameraPosition(
                                            CameraPosition(
                                                zoom: 18.0, target: LatLng(res.first.lat, res.first.lng))));
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
                                                searchResultList[index]
                                                    .mainText,
                                                style: const TextStyle(
                                                    color: black,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                searchResultList[index]
                                                    .secondaryText,
                                                style: const TextStyle(
                                                    color: black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                    color: lightOrange,
                                  ),
                              itemCount: searchResultList.length)
                        ],
                      ),
                    ),
                  )
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: primary,
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: Text(
                          block,
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                  10.verticalSpace,
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if(res.polygons.isNotEmpty){
                          ref.read(polyGonCoordinatesProvider.notifier).state = res.polygons.first.points;
                          if(latlng!=null){
                            ref.read(currentCoordinateProvider.notifier).state = [latlng!.latitude, latlng!.longitude];
                          }

                          context.router.push(AddAddressStationPartnerRoute(
                              state: state,
                              district: district,
                              area: area,
                              houseNo: houseNo,
                              pinCode: pinCode,
                              lat: _cameraPosition.target.latitude,
                              long: _cameraPosition.target.longitude));
                        }
                        else{
                          polygonDialog();

                        }


                      },
                      child: const Text('Proceed'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MapOverlayButtons extends StatelessWidget {
  const MapOverlayButtons({
    super.key,
    required this.iconData,
    required this.onTap,
  });

  final IconData iconData;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(5),
          height: 37,
          width: 37,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
          child: Icon(
            iconData,
            color: brown,
          )),
    );
  }
}

Future<Uint8List?> getBytesFromAsset(String path, int width) async {
  final ByteData data = await rootBundle.load(path);
  final ui.Codec codec = await ui
      .instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
  final ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
      ?.buffer
      .asUint8List();
}
