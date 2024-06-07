import 'dart:async';
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/controller/farm/choose_farm_controller.dart';
import 'package:kisaan_station/src/model/drawer/station_partner_form_model.dart';
import 'package:kisaan_station/src/model/farm/farm_entity.dart';
import 'package:kisaan_station/src/util/custom_drop_down_button.dart';
import 'package:kisaan_station/src/view/Farm/widget/crop_body.dart';
import 'package:kisaan_station/src/view/Farm/widget/crop_object.dart';
import 'package:kisaan_station/src/view/widget/dialogs/fail_dialog.dart';
import 'package:kisaan_station/src/view/widget/dialogs/loading_dialog.dart';

import '../../../global_providers.dart';
import '../../app/router/router.gr.dart';
import '../../controller/drawer/station_partner_controller.dart';
import '../../util/text_validation/text_validation.dart';
import '../widget/dialogs/success_dialog.dart';
import '../widget/textfield_widget.dart';

@RoutePage()
class AddFarmPage extends ConsumerStatefulWidget {
  const AddFarmPage({this.isOthers = false});
  final bool isOthers;

  @override
  ConsumerState<AddFarmPage> createState() => _AddFarmPageState();
}

class _AddFarmPageState extends ConsumerState<AddFarmPage> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _farmNameController = TextEditingController();
  final TextEditingController _farmerNameController = TextEditingController();
  final TextEditingController _mobileNoController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _irrigationMethodController =
      TextEditingController();
  final TextEditingController _waterController = TextEditingController();

  List<CropBody> cropsData = [];
  List<double> cropAreas = [];
  List<CropObject> cropsItems = [];
  List<String> units = ["acre"];
  String currentFarmUnit = "acre";

  String state = "";
  String pinCode = "";

  List<String> farmStatus = ['Cropped', 'Harvested', 'Ploughed'];
  List<String> irrigationStatus = [
    'Irrigated',
    'Required Irrigation',
    'Rainfed'
  ];
  String _selectedFarmStatus = "";
  String _selectedIrrigation = "Select Irrigation Status";
  String _selectedIrrigationPeriod = "Select Irrigation Period";

  void setFarmAddress(Placemark place) {
    final String subAd = place.subAdministrativeArea!.isNotEmpty
        ? "${place.subAdministrativeArea},"
        : "";

    final String local = place.locality!.isNotEmpty ? "${place.locality}," : "";

    final String subLocal =
        place.subLocality!.isNotEmpty ? "${place.subLocality}," : "";

    final String street = place.street!.isNotEmpty ? "${place.street}," : "";

    state = place.administrativeArea!.isNotEmpty
        ? "${place.administrativeArea}"
        : "";
    pinCode = place.postalCode!.isNotEmpty ? "${place.postalCode}" : "";

    final String address =
        "$street $subLocal $local $subAd ${place.administrativeArea}";
    _locationController.text = address;

    setState(() {});
  }

  void addCrop() {
    final key = UniqueKey();
    final newCrop = CropBody(key);
    cropsData.add(newCrop);
    cropsItems.add(CropObject(
      key: key,
      cropName: newCrop.cropName,
      cropArea: newCrop.cropArea,
      cropUnit: newCrop.cropUnit,
      showingDate: newCrop.showingDate,
      cropDesc: newCrop.cropDesc,
      onTap: () {
        removeCrop(key);
      },
    ));
    setState(() {});
  }

  void removeCrop(Key key) {
    cropsItems.removeWhere((element) => element.key == key);
    cropsData.removeWhere((element) => element.key == key);
    setState(() {});
  }

  LatLng calculateCentroid(List<LatLng> coordinates) {
    if (coordinates.isEmpty) {
      throw ArgumentError("List of coordinates is empty");
    }

    double sumLat = 0.0;
    double sumLng = 0.0;

    for (final point in coordinates) {
      sumLat += point.latitude;
      sumLng += point.longitude;
    }

    final double centroidLat = sumLat / coordinates.length;
    final double centroidLng = sumLng / coordinates.length;

    return LatLng(centroidLat, centroidLng);
  }

  Future<void> saveForm() async {
    if(_selectedFarmStatus != ""){
      if (formKey.currentState!.validate()) {
        final coordinates = ref.read(currentCoordinateProvider);
        final temp = ref.read(stationPartnerAddressProvider);
        final address = StationPartnerAddressModel.fromJson(jsonDecode(temp));

        String status = _selectedIrrigation;
        if (status == "Required Irrigation") {
          status = "Required";
        }

        final irrigation = Irrigation(
            status: status.trim().toLowerCase(),
            waterQuantity: int.tryParse(_waterController.text.trim()),
            method: _irrigationMethodController.text.trim());

        Plot? plot;
        Centroid? centroid;

        final List<LatLng> polyGonCoord = ref.read(polyGonCoordinatesProvider);
        FarmLocation farmLocation =
        FarmLocation(type: 'Point', coordinates: coordinates);
        if (polyGonCoord.isNotEmpty) {
          final List<Point> points = [];
          for (final element in polyGonCoord) {
            points.add(Point(lat: element.latitude, lng: element.longitude));
          }
          final LatLng centroidLatLng = calculateCentroid(polyGonCoord);

          centroid = Centroid(
              lat: centroidLatLng.latitude, lng: centroidLatLng.longitude);

          plot = Plot(type: "Polygon", coordinates: points, centroid: centroid);
          farmLocation =
              FarmLocation(type: 'Point', coordinates: [centroidLatLng.latitude, centroidLatLng.longitude]);
        } else{
          plot = null;
        }

        final farm = FarmDetails(
          plot: plot,
          location: farmLocation,
          farmStatus: _selectedFarmStatus.trim().toLowerCase(),
          irrigation: irrigation,
          farmName: _farmNameController.text,
          farmArea: double.parse(_areaController.text.trim()),
          farmAreaUnit: currentFarmUnit,
          address: _locationController.text.trim(),
          state: address.state,
          pincode: int.tryParse(address.pinCode) ?? 0,
        );
        final crops = [
          ...cropsData
              .map((e) => CropDetail(
            nameOfCrop: e.cropName.text,
            sowingDate: DateTime.parse(e.showingDate.text),
            cropArea: int.parse(e.cropArea.text),
            cropAreaUnit: e.cropUnit.text,
            cropDescription: e.cropDesc.text,
            cropReportStatus: 'Not Requested',
          ))
              .toList()
        ];
        var result;
        if(widget.isOthers){
          result =
          await ref.read(farmRepoProvider).addOtherFarm(farm: farm, crops: crops, farmerName: _farmNameController.text.trim(), mobileNo: _mobileNoController.text.trim());
        }
        else{
          result =
          await ref.read(farmRepoProvider).addFarm(farm: farm, crops: crops);
        }
        if (result) {
          successDialog(
            context,
            message: "Farm Added Successfully",
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          );
        } else {
          failDialog(context);
        }
      }
    } else {

    }

  }

  @override
  void initState() {
    super.initState();
    addCrop();
  }

  @override
  void dispose() {
    _farmNameController.dispose();
    _areaController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(areaValidateProvider, (previous, next) {});

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Farm',
          style: TextStyle(
              color: primary, fontWeight: FontWeight.w500, fontSize: 20.sp),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.router.pop();
          },
        ),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    child: ListView(
                      children: [
                        30.verticalSpace,
                        if (widget.isOthers)
                          Column(
                            children: [
                              AppTextField(
                                textController: _farmerNameController,
                                hintText: "Farmer Name",
                                maxlines: 1,
                                textCapitalization: TextCapitalization.words,
                                validator: (value) => Validate.empty(value!),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(30)
                                ],
                              ),
                              10.verticalSpace,
                              AppTextField(
                                keyboardType: TextInputType.phone,
                                textController: _mobileNoController,
                                hintText: "Mobile No",
                                maxlines: 1,
                                // textCapitalization: TextCapitalization.words,
                                validator: (value) => Validate.phone(value!),
                              ),
                              10.verticalSpace
                            ],
                          ),
                        AppTextField(
                          textController: _farmNameController,
                          hintText: "Farm Name",
                          maxlines: 1,
                          textCapitalization: TextCapitalization.words,
                          validator: (value) => Validate.empty(value!),
                          inputFormatters: [LengthLimitingTextInputFormatter(30)],
                        ),
                        10.verticalSpace,
                        AppTextField(
                          textController: _areaController,
                          hintText: "Fam Area (acre)",
                          maxlines: 1,
                          keyboardType: TextInputType.number,
                          validator: (value) => Validate.emptyNum(value!),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(4),
                          ],
                          onChanged: (val) {
                            ref.read(areaValidateProvider).setTotalArea(val);
                          },
                        ),
                        10.verticalSpace,
                        AppTextField(
                          onTap: () async {
                            showLoading(context);
                            final res =
                                await ref.read(locationProvider).getLocation();
                            if (res == null) return;
                            ref.read(currentCoordinateProvider.notifier).state = [
                              res.latitude!,
                              res.longitude!
                            ];
                            ref.read(currentAreaProvider.notifier).initArea(
                                  res.latitude!,
                                  res.longitude!,
                                );
                            setState(() {});
                            context.router
                                .popAndPush(ChooseFarmLocationRoute())
                                .then((value) => {
                                      _locationController.text = ref.read(
                                          stationPartnerAddressStringProvider)
                                    });
                          },
                          textController: _locationController,
                          readOnly: true,
                          hintText: "Location",
                          maxlines: 1,
                          suffixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Image.asset('assets/images/gps.png')),
                          textCapitalization: TextCapitalization.words,
                          validator: (value) => Validate.empty(value!),
                        ),
                        12.verticalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Farm Status',
                              style: TextStyle(
                                  color: primary,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: 'Cropped',
                                    groupValue: _selectedFarmStatus,
                                    onChanged: (value) => setState(
                                        () => _selectedFarmStatus = value!)),
                                const Text('Cropped'),
                                Radio(
                                    value: 'Harvested',
                                    groupValue: _selectedFarmStatus,
                                    onChanged: (value) => setState(
                                        () => _selectedFarmStatus = value!)),
                                const Text('Harvested'),
                                Radio(
                                    value: 'Ploughed',
                                    groupValue: _selectedFarmStatus,
                                    onChanged: (value) => setState(
                                        () => _selectedFarmStatus = value!)),
                                const Text('Ploughed'),
                              ],
                            )
                          ],
                        ),
                        12.verticalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Irrigation Status',
                              style: TextStyle(
                                  color: primary,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            12.verticalSpace,
                            CustomDropDownButton(
                              items: irrigationStatus,
                              selectedItem: _selectedIrrigation,
                              hintText: "Select Irrigation Status",
                              onChanged: (value) =>
                                  setState(() => _selectedIrrigation = value),
                            )
                          ],
                        ),
                        if (_selectedIrrigation == irrigationStatus[1])
                          Column(
                            children: [
                              10.verticalSpace,
                              CustomDropDownButton(
                                items: const [
                                  'Every Week',
                                  'Every 15 Days',
                                  'Every Month',
                                  'Other'
                                ],
                                selectedItem: _selectedIrrigationPeriod,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedIrrigationPeriod = value;
                                  });
                                },
                                hintText: 'Selected Irrigation Period',
                              ),
                              12.verticalSpace,
                              AppTextField(
                                hintText: 'Enter water quantity (kilo liter)',
                                keyboardType: TextInputType.number,
                                textController: _waterController,
                              ),
                              12.verticalSpace,
                              AppTextField(
                                hintText: 'Irrigation Method Suggested',
                                keyboardType: TextInputType.streetAddress,
                                textController: _irrigationMethodController,
                              )
                            ],
                          ),
                        Column(
                          children: [
                            20.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    addCrop();
                                  },
                                  child: Text(
                                    "Add Crop",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                8.horizontalSpace,
                              ],
                            ),
                            ...cropsItems,
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                10.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_selectedIrrigation == "Select Irrigation Status") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: primary,
                                  content: Text(
                                      "Irrigation Status is required*")));
                        } else if(_selectedFarmStatus == ""){
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: primary,
                                  content: Text(
                                      ""
                                          "Farm Status is required*")));
                        }else {
                          saveForm();
                        }
                      },
                      child: const Text("Submit")),
                ),
                10.verticalSpace
              ],
            ),
          ),
        ),
      ),
    );
  }
}
