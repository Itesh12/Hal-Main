 import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';

import '../../../../global_providers.dart';
import '../../../app/router/router.gr.dart';
import '../../../controller/drawer/station_partner_controller.dart';
import '../../../infrastructure/http/app_exception.dart';
import '../../../l10n/l10n.dart';
import '../../../model/drawer/station_partner_form_model.dart';
import '../../../util/image_picker/image_picker.dart';
import '../../../util/services/shared_preferences.dart';
import '../../../util/text_validation/text_validation.dart';
import '../../widget/dialogs/farm_location_dailog.dart';
import '../../widget/dialogs/loading_dialog.dart';
import '../../widget/dialogs/success_dialog.dart';
import '../../widget/snackbar.dart';
import '../../widget/textfield_widget.dart';

@RoutePage()
class StationPatnerFormPage extends ConsumerStatefulWidget {
  const StationPatnerFormPage({Key? key}) : super(key: key);

  @override
  _StationPatnerFormPageState createState() => _StationPatnerFormPageState();
}

class _StationPatnerFormPageState extends ConsumerState<StationPatnerFormPage> {
  File? frontImage;
  File? backImage;
  List<File>? images = [];
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _mobileNoTextEditingController =
      TextEditingController();
  final TextEditingController _emailAddressTextEditingController =
      TextEditingController();
  final TextEditingController _locationTextEditingController =
      TextEditingController();
  final TextEditingController _detailsTextEditingController =
      TextEditingController();

  final TextEditingController _dcIdController = TextEditingController();
  final TextEditingController _dcNameController = TextEditingController();
  // final TextEditingController _dcLocationController = TextEditingController();

  Position? _currentPosition;
  String? _currentAddress;

  @override
  void initState() {
    super.initState();

  }

  // Future<bool> _handleLocationPermission() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text(
  //             'Location services are disabled. Please enable the services')));
  //     return false;
  //   }
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(content: Text('Location permissions are denied')));
  //       return false;
  //     }
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text(
  //             'Location permissions are permanently denied, we cannot request permissions.')));
  //     return false;
  //   }
  //   return true;
  // }
  //
  // Future<void> _getCurrentPosition() async {
  //   final hasPermission = await _handleLocationPermission();
  //
  //   if (!hasPermission) return;
  //   await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
  //       .then((Position position) {
  //     setState(() => _currentPosition = position);
  //     _getAddressFromLatLng(_currentPosition!);
  //   }).catchError((e) {
  //     debugPrint(e);
  //   });
  // }
  //
  // Future<void> _getAddressFromLatLng(Position position) async {
  //   await placemarkFromCoordinates(
  //           _currentPosition!.latitude, _currentPosition!.longitude)
  //       .then((List<Placemark> placemarks) {
  //     final Placemark place = placemarks[0];
  //     setState(() {
  //       _currentAddress =
  //           '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
  //       _locationTextEditingController.text = _currentAddress.toString();
  //     });
  //   }).catchError((e) {
  //     debugPrint(e);
  //   });
  // }

  Future<void> pickImage({bool isFrontImage = false}) async {
    final source = await ref.read(mediaProvider).chooseSource(context);
    if (source != null) {
      File? output;
      if (source) {
        output = await ref.read(mediaProvider).captureMedia();
      } else {
        output = await ref.read(mediaProvider).pickImage();
      }

      if (output != null) {
        setState(() {
          isFrontImage ? frontImage = output : backImage = output;

          isFrontImage ? images!.add(frontImage!) : images!.add(backImage!);
        });
      }
    }
  }

  bool showMapLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provide Details'),
      ),
      body: Padding(
        padding: pagePadding,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Form(
                    key: _formKey,
                    child:
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const Text('Name'),
                      10.verticalSpace,
                      AppTextField(
                        textController: _nameTextEditingController,
                        hintText: AppLocalizations.of(context)!.enter_your_name,
                        maxlines: 1,
                        textCapitalization: TextCapitalization.words,
                        validator: (value) =>
                            Validate.minLength(value: value!, minLen: 3),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(24),
                        ],
                      ),
                      10.verticalSpace,
                          Text(AppLocalizations.of(context)!.mobile_no),
                      10.verticalSpace,
                      AppTextField(
                        hintText: 'Mobile No.',
                        textController: _mobileNoTextEditingController,
                        validator: (value) => Validate.phone(value!),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                      ),
                      10.verticalSpace,
                      const Text('Email Address'),
                      10.verticalSpace,
                      AppTextField(
                        hintText: AppLocalizations.of(context)!.email_hint,
                        textController: _emailAddressTextEditingController,
                        validator: (value) => Validate.email(value!),
                      ),
                      10.verticalSpace,
                      const Text('Location'),
                          10.verticalSpace,
                          Consumer(builder: (context, ref, child) {
                            return AppTextField(
                              hintText: 'Select DC Location ',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Location is required';
                                } else {
                                  return null;
                                }
                              },
                              readOnly: true,
                              textController: _locationTextEditingController,
                              onTap: () async {
                                setState(() {
                                  showLoading(context);
                                });
                                bool proceed = await ref.read(locationProvider).checkLocation();



                                if (!proceed) {
                                  proceed = await askFarmLocationDialog(
                                    context,
                                    title: "Allow Location Access",
                                    subTitle: false,
                                    message:
                                    "To measure your farm you have to be present in your field",
                                    onPressed: () async {
                                      context.popRoute(true);
                                    },
                                  ) ??
                                      false;
                                } else {
                                  final res = await ref.read(locationProvider).getLocation();
                                  if (res == null) return;
                                  ref.read(currentCoordinateProvider.notifier).state = [
                                    res.latitude!,
                                    res.longitude!
                                  ];
                                  ref.read(currentAreaProvider.notifier).initArea(
                                    res.latitude!,
                                    res.longitude!,
                                  );
                                  context.router.pop();
                                  context.router
                                      .push(ChooseDCLocationRoute(fromAddNewAddress: false))
                                      .then((value) => {
                                    _locationTextEditingController.text = ref
                                        .read(stationPartnerAddressStringProvider)
                                  });
                                }

                              },
                              suffixIcon: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Image.asset('assets/images/gps.png')),
                            );
                          }),
                          10.verticalSpace,
                          const Text('District Center ID'),
                          10.verticalSpace,
                          AppTextField(
                            hintText: 'DC Id',
                            textController: _dcIdController,
                            validator: (value) => Validate.empty(value!),
                          ),
                          10.verticalSpace,
                          const Text('District Center Name'),
                          10.verticalSpace,
                          AppTextField(
                            hintText: 'DC Name',
                            textController: _dcNameController,
                            validator: (value) => Validate.empty(value!),
                          ),
                      10.verticalSpace,
                      const Text('Upload Adhaar Card'),
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: frontImage != null
                                ? Image.file(
                                    frontImage!,
                                    height: 119.h,
                                    width: 159.w,
                                  )
                                : InkWell(
                                    onTap: () {
                                      pickImage(isFrontImage: true);
                                    },
                                    child: Container(
                                      height: 119.h,
                                      width: 159.w,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF5F5F5),
                                          borderRadius: BorderRadius.circular(8.5)),
                                      child: Column(
                                        children: [
                                          25.verticalSpace,
                                          const Text('Upload Front Side'),
                                          15.verticalSpace,
                                          Container(
                                            height: 26.h,
                                            width: 95.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4.r),
                                                border: Border.all(
                                                    color: const Color(0xff848484))),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/images/gallery.svg',
                                                  height: 8.h,
                                                  width: 8.h,
                                                ),
                                                5.horizontalSpace,
                                                Text(
                                                  'Upload Image',
                                                  style: TextStyle(fontSize: 10.sp),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                          )),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: backImage != null
                                ? Image.file(
                                    backImage!,
                                    height: 119.h,
                                    width: 159.w,
                                  )
                                : InkWell(
                                    onTap: () {
                                      pickImage();
                                    },
                                    child: Container(
                                      height: 119.h,
                                      width: 159.w,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF5F5F5),
                                          borderRadius: BorderRadius.circular(8.5)),
                                      child: Column(
                                        children: [
                                          25.verticalSpace,
                                          const Text('Upload Back Side'),
                                          15.verticalSpace,
                                          Container(
                                            height: 26.h,
                                            width: 95.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4.r),
                                                border: Border.all(
                                                    color: const Color(0xff848484))),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/images/gallery.svg',
                                                  height: 8.h,
                                                  width: 8.h,
                                                ),
                                                5.horizontalSpace,
                                                Text(
                                                  'Upload Image',
                                                  style: TextStyle(fontSize: 10.sp),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                          )),
                        ],
                      ),
                      const Text('Add Business Details'),
                      10.verticalSpace,
                      AppTextField(
                        maxlines: 4,
                        textController: _detailsTextEditingController,
                        validator: (value) =>
                            Validate.minLength(value: value!, minLen: 5),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(600),
                        ],
                      ),
                          30.verticalSpace,
                    ]),
                  ),
                ],
              ),
            ),
            10.verticalSpace,
            Row(
              children: [
                InkWell(
                  onTap: (){
                    context.router.pop();
                  },
                  child: Container(
                    width: 152.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                        color: const Color(0xffEEEEEE),
                        borderRadius: BorderRadius.circular(32.r)),
                    child: const Center(child: Text('Cancel')),
                  ),
                ),
                12.horizontalSpace,
                InkWell(
                  onTap: () {
                    if (images!.length != 2) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(getSnackBar("upload addhar images"));
                    } else {
                      submit(context);
                    }
                  },
                  child: Container(
                    width: 152.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                        color: const Color(0xffE26B26),
                        borderRadius: BorderRadius.circular(32.r)),
                    child: const Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
              ],
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  Future<void>  submit(BuildContext context) async {
    final lat = ref.watch(latLongProvider).coordinates[0];
    final long = ref.watch(latLongProvider).coordinates[1];
    String? state;
    String? zipCode;
    final String address = _locationTextEditingController.text.toString();
    final RegExp exp = RegExp(r"([A-Za-z\s]+)[,]\s([\d]+)");
    final Iterable<RegExpMatch> matches = exp.allMatches(address);
    for (final RegExpMatch m in matches) {
      state = m.group(1).toString(); // prints "Santa Clara County"
      zipCode = m.group(2).toString(); // prints "94043"
    }
    final _locationList = StationPartnerAddressModel(
        type: "Point",
        coordinates: [lat, long],
        address: _locationTextEditingController.text,
        state: state ?? "Not found",
        pinCode: zipCode ?? " 123456");
    if (_formKey.currentState!.validate() && images!.isNotEmpty) {
      final StationPartnerFormModel _stationPartnerdata =
          StationPartnerFormModel(
              userId: UserPreferences.userId,
              name: _nameTextEditingController.text.trim(),
              mobileNo: _mobileNoTextEditingController.text.trim(),
              mailId: _emailAddressTextEditingController.text.trim(),
              businessDetails: _detailsTextEditingController.text.trim(),
              ksId: _dcIdController.text.trim(),
              ksLocation: jsonEncode(_locationList),
              ksName: _dcNameController.text.trim());

      showLoading(context);
      try {
        await ref
            .read(stationPartnerFormSubmitProvider)
            .stationPartnerFormSubmit(
                stationPartnerdata: _stationPartnerdata, images: images);

        // Utils.farmAddedMessage("your request send successfully", context);
        context.router.pop();
        successDialog(context, onPressed: () {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
        });
      } on AppException catch (e) {
        e.whenOrNull(
          connectivity: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
                getSnackBar("Please check your internet connection"));
          },
          errorWithMessage: (message) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(getSnackBar(message));
          },
          error: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context)
                .showSnackBar(getSnackBar("Something went wrong"));
          },
        );
      }
    }
  }
}
