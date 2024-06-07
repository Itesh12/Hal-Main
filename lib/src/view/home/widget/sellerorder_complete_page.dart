import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/controller/drawer/station_partner_controller.dart';

import '../../../app/router/router.gr.dart';
import '../../../constants/colors.dart';
import '../../../model/station/order_deliver_model.dart';
import '../../../model/station/seller_orderlist_model.dart';
import '../../../util/image_picker/image_picker.dart';
import '../../../util/services/shared_preferences.dart';
import '../../widget/imageViewScreen.dart';
import '../../widget/snackbar.dart';

@RoutePage()
class SellerOrderCompletePage extends ConsumerStatefulWidget {
  final SellerOrderlistModel sellerOrderlistModel;
  const SellerOrderCompletePage(
      {required this.sellerOrderlistModel, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SellerOrderCompletePageState();
}

class _SellerOrderCompletePageState
    extends ConsumerState<SellerOrderCompletePage> {
  final TextEditingController _farmDetailsTextEditingController =
      TextEditingController();
  final TextEditingController _farmUnitTextEditingController =
      TextEditingController();
  final TextEditingController _farmAreaTextEditingController =
      TextEditingController();
  final farmEditingController1 = TextEditingController();
  final _dronenumbercontroller = TextEditingController();
  final farmEditingController2 = TextEditingController();
  final _locationController = TextEditingController();
  final notesEditingController2 = TextEditingController();

  bool isReadonly = true;
  final List<File> _pickedImages = [];
  // final List<FarmDetailOrder> _farmdetails = [];
  List _items = [];

  late String state;
  late String pinCode;
  Position? _currentPosition;
  String? _currentAddress;

  @override
  void initState() {
    super.initState();
    _farmUnitTextEditingController.text = "acre";
    farmEditingController2.text = "0";
    calculateArea();
    _getDrone();
    _getCurrentPosition();
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      final Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
        _locationController.text = _currentAddress.toString();
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getDrone() async {
    final val = await ref.read(droneServiceRepoProvider).getSellerStatus();
    try {
      _items = await ref
          .read(droneServiceRepoProvider)
          .getSellerDrone(sellerId: val.id);
      setState(() {});
    } on Exception {
      // TODO
    }
  }

  @override
  void dispose() {
    farmEditingController1.dispose();
    farmEditingController2.dispose();
    _dronenumbercontroller.dispose();
    _locationController.dispose();
    notesEditingController2.dispose();
    _farmAreaTextEditingController.dispose();

    super.dispose();
  }

  void calculateArea() {
    final area = widget.sellerOrderlistModel.farmDetails
        .map((e) => e.area)
        .fold(0.0, (previousValue, element) => previousValue + element);
    farmEditingController1.text = area.toString();
  }

  Future<void> chooseMultiImage(
      {required int imageCount, required int index}) async {
    final pickedFile = await ref
        .read(mediaProvider)
        .pickMultiImage(count: imageCount, context: context);

    if (pickedFile.isNotEmpty) {
      _pickedImages.insertAll(index, pickedFile);
      setState(() {});
    }
  }

  Future<void> chooseImage({required bool isCamera}) async {
    File? pickedFile;
    if (isCamera) {
      pickedFile = await ref.read(mediaProvider).captureMedia();
    } else {
      pickedFile = await ref.read(mediaProvider).pickImage();
    }
    if (pickedFile != null) {
      _pickedImages.add(pickedFile);
      setState(() {});
    }
  }

  String userId = UserPreferences.userId;

  // final items = _items;

  final List<FarmDetailOrder> _farmDetailList = [];
  @override
  Widget build(BuildContext context) {
    // for getting total price

    const String defaultPrice = "0";
    final extraPrice = defaultPrice + farmEditingController1.text.toString();
    var estimatedPrice = double.parse(extraPrice) * 500;

    //for geeting extra acre and recieve ammount

    const String ammount = "0";
    final price = ammount + farmEditingController2.text.toString();
    final double totalRecieved = 0 + double.parse(price);
    var totalremaining = estimatedPrice - totalRecieved;

    // String totalRemainAmount = totalremaining.toString();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: Color(0xff585858),
            )),
        centerTitle: false,
        title: Text(
          "Order: ${widget.sellerOrderlistModel.bookingId}",
          style: TextStyle(
            fontSize: 20.sp,
            color: const Color(0xff563e1f),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () async {
          final lat = ref.watch(latLongProvider).coordinates[0];
          final long = ref.watch(latLongProvider).coordinates[1];
          final _farmList = OcLocation(
              address: _locationController.text,
              latitude: long.toString(),
              longitude: lat.toString());
          final _farmDetailList = FarmDetailOrder(
            farmName: widget.sellerOrderlistModel.farmDetails.first.farmName,
            area: double.parse(farmEditingController1.text),
            areaUnit: _farmUnitTextEditingController.text,
          );
          if (_pickedImages.isNotEmpty &&
              _locationController.text.isNotEmpty &&
              _dronenumbercontroller.text.isNotEmpty) {
            final response = await showDialogIfFirstLoaded(context);
            if (response) {
              await ref.read(stationSellRepoProvider).sellerOrderdelivered(
                    orderDeliverdModel: OrderDeliverdModel(
                      id: widget.sellerOrderlistModel.id,
                      estimatedPrice: estimatedPrice.toString(),
                      paymentReceived: farmEditingController2.text,
                      remainingPayment: totalremaining.toString(),
                      OCLocation: jsonEncode(_farmList),
                      remarks: notesEditingController2.text,
                      equipmentNo: _dronenumbercontroller.text,
                      addFarmDetails: jsonEncode(_farmDetailList),
                    ),
                    images: _pickedImages,
                  );

              context.router.push(OrderSubmitRoute(
                  sellerOrderlistModel: widget.sellerOrderlistModel));

              ref.refresh(sellerOrderListProvider(userId));
              final _myListingController =
                  ref.watch(sellerOrderListProvider(UserPreferences.userId));
              _myListingController.refresh(context);
            } else {}
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                getSnackBar("Please provide details in mandatory field"));
          }
        },
        child: Container(
          height: 48.h,
          width: 328.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(34.0),
            gradient: const LinearGradient(
                colors: [Color(0xfff39a00), Color(0xffe26b26)]),
          ),
          child: Center(
            child: Text(
              "Confirm Delivery",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: const Color(0xffffffff),
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.verticalSpace,
            Container(
              height: 43,
              // width: 327,
              decoration: BoxDecoration(
                color: const Color(0xfffff4e3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Total Estimated Price  $estimatedPrice",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: const Color(0xfff39a00),
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            12.verticalSpace,

            //         if (_farmDetailList.isEmpty)
            // InkWell(
            //   onTap: () async {
            //     await _displayDialog(context, _dialogFormKey);
            //     setState(() {});
            //   },
            //   child: Row(
            //     children: [
            //       Container(
            //         width: 300.w,
            //         padding: EdgeInsets.symmetric(
            //             horizontal: 10.w, vertical: 10.h),
            //         decoration: BoxDecoration(
            //             color: const Color(0xffF9F9F9),
            //             borderRadius: BorderRadius.circular(8.r)),
            //         child: Row(
            //           children: [
            //             const Text(
            //               'Name: ',
            //               style: TextStyle(color: grey),
            //             ),
            //             SizedBox(
            //                 width: 80.w,
            //                 child: const Text(
            //                   w,
            //                   overflow: TextOverflow.ellipsis,
            //                 )),
            //             10.horizontalSpace,
            //             const Text(
            //               'Area: ',
            //               style: TextStyle(color: grey),
            //             ),
            //             SizedBox(
            //               width: 100.w,
            //               child: const Text(
            //                 '',
            //                 overflow: TextOverflow.ellipsis,
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // )
            // else
            // ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: widget.sellerOrderlistModel.farmDetails.length,
            //     itemBuilder: (context, index) {
            //       return OrderAreaCard(
            //           farmDetail:
            //               widget.sellerOrderlistModel.farmDetails[index]);
            //     }),
            Text(
              "Farm Details",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: const Color(0xffe26b26),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500),
            ),
            12.verticalSpace,
            ListView.builder(
                shrinkWrap: true,
                itemCount: widget.sellerOrderlistModel.farmDetails.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 3, vertical: 3),
                        decoration: BoxDecoration(
                            // color: const Color(0xffF9F9F9),
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Row(
                          children: [
                            const Text(
                              'Name: ',
                              style: TextStyle(color: grey),
                            ),
                            3.horizontalSpace,
                            SizedBox(
                                width: 150.w,
                                child: Text(
                                  widget.sellerOrderlistModel.farmDetails[index]
                                      .farmName,
                                  overflow: TextOverflow.ellipsis,
                                )),
                            // 10.horizontalSpace,
                            const Text(
                              'Area: ',
                              style: TextStyle(color: grey),
                            ),
                            3.horizontalSpace,
                            SizedBox(
                              width: 100.w,
                              child: Text(
                                widget.sellerOrderlistModel.farmDetails[index]
                                        .area
                                        .toString() +
                                    widget.sellerOrderlistModel
                                        .farmDetails[index].areaUnit,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            // InkWell(
                            //     onTap: () async {
                            //       await _displayDialog(context, _dialogFormKey);
                            //       setState(() {});
                            //     },
                            //     child: const Text(
                            //       'Edit',
                            //       style: TextStyle(color: primary),
                            //     )),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
            12.verticalSpace,
            Text(
              "Total Acre",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: const Color(0xffe26b26),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500),
            ),

            SizedBox(
              height: 30.h,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter total acre you covered",
                  hintStyle: TextStyle(
                      color: Color(0xff8e8e8e),
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                  focusedBorder: InputBorder.none,
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Total Area  is required';
                  } else {
                    return null;
                  }
                },
                style: const TextStyle(
                    color: Color(0xff2b2b2b),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                controller: farmEditingController1,
                onChanged: (value) => setState(() {
                  estimatedPrice = 0 + estimatedPrice;
                }),
              ),
            ),
            const Divider(
              color: Color(0xffe4e4e4),
              height: 2,
              thickness: 1,
            ),
            12.verticalSpace,
            Text(
              "Drone No",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: const Color(0xffe26b26),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 45.h,
              child: TextField(
                readOnly: true,
                style: const TextStyle(
                    color: Color(0xff2b2b2b),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                controller: _dronenumbercontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Select drone number",
                  hintStyle: TextStyle(
                      color: const Color(0xff8e8e8e),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                  suffixIcon: PopupMenuButton<String>(
                    icon: const Icon(Icons.arrow_drop_down),
                    onSelected: (String value) {
                      _dronenumbercontroller.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return _items.map<PopupMenuItem<String>>((value) {
                        return PopupMenuItem(value: value, child: Text(value));
                      }).toList();
                    },
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 25,
            //   child: TextField(
            //     decoration: const InputDecoration(
            //       border: InputBorder.none,
            //       hintText: "please enter drone number",
            //       hintStyle: TextStyle(
            //           color: const Color(0xff8e8e8e),
            //           fontSize: 12,
            //           fontWeight: FontWeight.w500),
            //       focusedBorder: InputBorder.none,
            //     ),
            //     controller: _dronenumbercontroller,
            //     // keyboardType: TextInputType.number,
            //   ),
            // ),

            // Row(
            //   children: [
            //     SizedBox(
            //       height: 22,
            //       width: 320,
            //       child: TextField(
            //         decoration: const InputDecoration(
            //           border: InputBorder.none,
            //           focusedBorder: InputBorder.none,
            //         ),
            //         readOnly: isReadonly,
            //         controller: farmEditingController1,
            //       ),
            //     ),
            //     InkWell(
            //       onTap: () {
            //         isReadonly = true;
            //       },
            //       child: Text(
            //         "Edit",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //             color: const Color(0xff756e7b),
            //             fontSize: 16.sp,
            //             fontWeight: FontWeight.w500),
            //       ),
            //     ),
            //   ],
            // ),
            const Divider(
              color: Color(0xffe4e4e4),
              height: 2,
              thickness: 1,
            ),

            // TextField(
            //   decoration: const InputDecoration(
            //     border: InputBorder.none,
            //     focusedBorder: InputBorder.none,
            //   ),
            //   readOnly: isReadonly,
            //   controller: _dronenumbercontroller,
            // ),

            // Row(
            //   children: [
            //     SizedBox(
            //       width: 320,
            //       child: TextField(
            //         decoration: const InputDecoration(
            //           border: InputBorder.none,
            //           focusedBorder: InputBorder.none,
            //         ),
            //         readOnly: isReadonly,
            //         controller: farmEditingController2,
            //       ),
            //     ),
            //     InkWell(
            //       onTap: () {
            //         isReadonly = true;
            //       },
            //       child: Text(
            //         "Edit",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //             color: const Color(0xff756e7b),
            //             fontSize: 16.sp,
            //             fontWeight: FontWeight.w500),
            //       ),
            //     ),
            //   ],
            // ),
            // const Divider(
            //   color: Color(0xffe4e4e4),
            //   height: 2,
            //   thickness: 1,
            // ),
            12.verticalSpace,
            Text(
              "Payment",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: const Color(0xffe26b26),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500),
            ),
            5.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 155,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Received",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: const Color(0xff8e8e8e),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 25,
                        child: TextFormField(
                          style: const TextStyle(
                              color: Color(0xff2b2b2b),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintStyle: TextStyle(
                                color: Color(0xff8e8e8e),
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          keyboardType: TextInputType.number,

                          controller: farmEditingController2,

                          onChanged: (value) => setState(() {
                            totalremaining = 0 + totalremaining;
                            if (value.isNotEmpty) {
                              if (double.parse(value) > estimatedPrice) {
                                farmEditingController2.text =
                                    estimatedPrice.toString();
                              }
                            }
                          }),

                          // onEditingComplete: () {
                          //   setState(() {
                          //     totalremaining = 0 + totalremaining;
                          //   });
                          // },
                        ),
                      ),
                      2.verticalSpace,
                      const Divider(
                        color: Color(0xffe4e4e4),
                        height: 2,
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 155,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remaining",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: const Color(0xff8e8e8e),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      if (farmEditingController2.value.text != "")
                        Text(
                          totalremaining.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: const Color(0xff2b2b2b),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        )
                      else
                        Text(
                          estimatedPrice.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: const Color(0xff2b2b2b),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      2.verticalSpace,
                      const Divider(
                        color: Color(0xffe4e4e4),
                        height: 2,
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            12.verticalSpace,
            Text(
              "Location",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: const Color(0xffe26b26),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500),
            ),

            //////////////
            8.verticalSpace,
            SizedBox(
              height: 20,
              child: TextField(
                controller: _locationController,
                readOnly: true,
                style: const TextStyle(
                    color: Color(0xff2b2b2b),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintText: _currentPosition == null
                      ? "can not fetch location"
                      : _currentAddress,
                  hintStyle: const TextStyle(
                      color: Color(0xff2b2b2b),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),

                // hintText: AppLocalizations.of(context)!.enter_your_name,

                textCapitalization: TextCapitalization.words,
              ),
            ),
            const Divider(
              color: Color(0xffe4e4e4),
              height: 2,
              thickness: 1,
            ),
            15.verticalSpace,
            Text(
              "Add Feild photo",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: const Color(0xffe26b26),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500),
            ),
            12.verticalSpace,
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    _pickedImages.length > 5 ? 6 : _pickedImages.length + 1,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  final idx = _pickedImages.length == 6 ? index : index - 1;
                  return index == 0 && _pickedImages.length < 6
                      ? InkWell(
                          onTap: _pickedImages.length == 6
                              ? null
                              : () async {
                                  // context.popRoute();
                                  final isCamera = await ref
                                      .read(mediaProvider)
                                      .chooseSourceSeller(context);
                                  if (isCamera != null) {
                                    if (isCamera) {
                                      chooseImage(isCamera: isCamera);
                                      setState(() {});
                                    } else {
                                      chooseMultiImage(
                                          imageCount: 6, index: index);
                                    }
                                  }
                                },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20, bottom: 20.0),
                            child: Container(
                              height: 55.h,
                              width: 55.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9.r)),
                                  border: Border.all(
                                      color: const Color(0xffE5E5E5))),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  size: 40.h,
                                  color: grey,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ImageViewScreen(
                                          image: _pickedImages[idx]),
                                    ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, bottom: 30.0),
                                child: Container(
                                  height: 65.w,
                                  width: 65.w,
                                  margin: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(9.r)),
                                      image: DecorationImage(
                                          image: FileImage(_pickedImages[idx]),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  _pickedImages.removeAt(idx);
                                  setState(() {});
                                },
                                child: SvgPicture.asset(
                                    'assets/images/remove_icon.svg')),
                          ],
                        );
                }),
            // const Divider(
            //   color: Color(0xffe4e4e4),
            //   height: 2,
            //   thickness: 1,
            // ),
            15.verticalSpace,
            Text(
              "Add Notes",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: const Color(0xffe26b26),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500),
            ),
            TextField(
              style: TextStyle(
                  color: const Color(0xffa0a0a0),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                hintText: "Write Your Text Here (optional)",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintStyle: TextStyle(
                    color: const Color(0xffa0a0a0),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
              ),
              maxLines: 4,
              controller: notesEditingController2,
            ),
            // const Divider(
            //   color: Color(0xffe4e4e4),
            //   height: 2,
            //   thickness: 1,
            // ),
            25.verticalSpace,
            // Center(
            //   child: InkWell(
            //     onTap: () async {
            //       final lat = ref.watch(latLongProvider).coordinates[0];
            //       final long = ref.watch(latLongProvider).coordinates[1];
            //       final _farmList = OcLocation(
            //           address: _locationController.text,
            //           latitude: long.toString(),
            //           longitude: lat.toString());
            //       final _farmDetailList = FarmDetailOrder(
            //         farmName:
            //             widget.sellerOrderlistModel.farmDetails.first.farmName,
            //         area: double.parse(farmEditingController1.text),
            //         areaUnit: _farmUnitTextEditingController.text,
            //       );
            //       if (_pickedImages.isNotEmpty &&
            //           _locationController.text.isNotEmpty &&
            //           _dronenumbercontroller.text.isNotEmpty) {
            //         final response = await showDialogIfFirstLoaded(context);
            //         if (response) {
            //           await ref
            //               .read(stationSellRepoProvider)
            //               .sellerOrderdelivered(
            //                 orderDeliverdModel: OrderDeliverdModel(
            //                   id: widget.sellerOrderlistModel.id,
            //                   estimatedPrice: estimatedPrice.toString(),
            //                   paymentReceived: farmEditingController2.text,
            //                   remainingPayment: totalremaining.toString(),
            //                   OCLocation: jsonEncode(_farmList),
            //                   remarks: notesEditingController2.text,
            //                   equipmentNo: _dronenumbercontroller.text,
            //                   addFarmDetails: jsonEncode(_farmDetailList),
            //                 ),
            //                 images: _pickedImages,
            //               );

            //           context.router.push(OrderSubmitRoute(
            //               sellerOrderlistModel: widget.sellerOrderlistModel));

            //           ref.refresh(sellerOrderListProvider(userId));
            //           final _myListingController = ref.watch(
            //               sellerOrderListProvider(UserPreferences.userId));
            //           _myListingController.refresh(context);
            //         } else {}
            //       } else {
            //         ScaffoldMessenger.of(context).showSnackBar(getSnackBar(
            //             "Please provide details in mandatory field"));
            //       }
            //     },
            //     child: Container(
            //       height: 48.h,
            //       width: 328.w,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(34.0),
            //         gradient: const LinearGradient(
            //             colors: [Color(0xfff39a00), Color(0xffe26b26)]),
            //       ),
            //       child: Center(
            //         child: Text(
            //           "Confirm Delivery",
            //           textAlign: TextAlign.center,
            //           style: TextStyle(
            //               color: const Color(0xffffffff),
            //               fontSize: 17.sp,
            //               fontWeight: FontWeight.w500),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            // 10.verticalSpace,
            // const Divider(
            //   color: Color.fromARGB(255, 222, 220, 220),
            //   height: 2,
            //   thickness: 1,
            // ),
            // 30.verticalSpace,
            // Center(
            //   child: SizedBox(
            //     height: 42,
            //     width: 207,
            //     child: ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //           backgroundColor: const Color(0xffe26b26),
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(40.0),
            //           ),
            //           // background
            //         ),
            //         onPressed: () {
            //           context.router.push(const AboutOrderRoute());
            //         },
            //         child: const Text('Complete Order',
            //             style: TextStyle(
            //                 fontSize: 14,
            //                 color: Colors.white,
            //                 fontWeight: FontWeight.w500))),
            //   ),
            // ),
          ],
        ),
      )),
    );
  }
}

Future<bool> showDialogIfFirstLoaded(BuildContext context) async {
  final res = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      // return object of type Dialog
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: SizedBox(
          height: 285.h,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Complete delivery",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color(0xff1a1a1a),
                      fontSize: 18,
                      fontWeight: FontWeight.w800),
                ),
                12.verticalSpace,
                const Text(
                  "Are you sure you want to complete the delivery, You can not edit the details once its is uploaded",
                  style: TextStyle(
                      color: Color(0xff8c8c8c),
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                20.verticalSpace,
                Center(
                    child: SizedBox(
                  height: 41,
                  width: 205,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffe26b26),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        // background
                      ),
                      onPressed: () async {
                        context.router.pop(true);
                      },
                      child: const Text('Yes',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w500))),
                )),
                10.verticalSpace,
                Center(
                    child: SizedBox(
                  height: 41,
                  width: 205,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffdddddd),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        // background
                      ),
                      onPressed: () {
                        context.router.pop(false);
                      },
                      child: const Text('Cancel',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff606060),
                              fontWeight: FontWeight.w500))),
                )),
              ],
            ),
          ),
        ),
        // actions: <Widget>[
        //   // usually buttons at the bottom of the dialog
        //   TextButton(
        //     child: const Text("No"),
        //     onPressed: () {
        //       context.router.pop();
        //     }
        //   ),
        //   TextButton(
        //     child: const Text("Yes"),
        //     onPressed: () {
        //       context.router.push(const OrderSubmitRoute());

        //     },
        //   ),
        // ],
      );
    },
  );
  return res ?? false;
}
