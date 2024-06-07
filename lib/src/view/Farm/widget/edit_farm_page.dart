import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kisaan_station/src/model/farm/farm_entity.dart';
import 'package:kisaan_station/src/util/text_validation/text_format.dart';
import 'package:kisaan_station/src/view/Farm/widget/crop_body.dart';
import 'package:kisaan_station/src/view/widget/dialogs/loading_dialog.dart';

import '../../../../global_providers.dart';
import '../../../app/router/router.gr.dart';
import '../../../constants/colors.dart';
import '../../../controller/drawer/station_partner_controller.dart';
import '../../../controller/farm/choose_farm_controller.dart';
import '../../../model/drawer/station_partner_form_model.dart';
import '../../../util/custom_drop_down_button.dart';
import '../../../util/text_validation/text_validation.dart';
import '../../widget/dialogs/fail_dialog.dart';
import '../../widget/dialogs/success_dialog.dart';
import '../../widget/textfield_widget.dart';
import 'crop_object.dart';

@RoutePage()
class EditFarmPage extends ConsumerStatefulWidget {
  const EditFarmPage({required this.farmEntity, required this.isOthers});
  final FarmEntity farmEntity;
  final bool isOthers;

  @override
  ConsumerState<EditFarmPage> createState() => _EditFarmPageState();
}

class _EditFarmPageState extends ConsumerState<EditFarmPage> {
  final formKey = GlobalKey<FormState>();

  bool loading = true;

  Plot? plot;
  Centroid? centroid;
  FarmLocation? farmLocation;

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
  late String _selectedFarmStatus;
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

  void addCrop(int? index) {
    final key = UniqueKey();
    final newCrop = CropBody(key);

    if (index != null) {
      final cropDetails = widget.farmEntity.cropDetails[index];
      newCrop.cropArea.text = cropDetails.cropArea.toString();
      newCrop.cropDesc.text = cropDetails.cropDescription;
      newCrop.cropName.text = cropDetails.nameOfCrop;
      newCrop.showingDate.text = cropDetails.sowingDate!.toString();
      newCrop.cropUnit.text = cropDetails.cropAreaUnit;
    }
    cropsData.add(newCrop);

    cropsItems.add(CropObject(
      key: key,
      cropName: newCrop.cropName,
      cropArea: newCrop.cropArea,
      cropUnit: newCrop.cropUnit,
      showingDate: newCrop.showingDate,
      cropDesc: newCrop.cropDesc,
      validation: false,
      onTap: () {
        removeCrop(key);
      },
    ));
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



      final List<LatLng> polyGonCoord = ref.read(polyGonCoordinatesProvider);

      if(coordinates.isNotEmpty){
        farmLocation =
            FarmLocation(type: 'Point', coordinates: coordinates);
      }

      if (polyGonCoord.isNotEmpty) {
        final List<Point> points = [];
        for (final element in polyGonCoord) {
          points.add(Point(lat: element.latitude, lng: element.longitude));
        }
        final LatLng centroidLatLng = calculateCentroid(polyGonCoord);

        centroid = Centroid(
            lat: centroidLatLng.latitude, lng: centroidLatLng.longitude);

        plot = Plot(type: "Polygon", coordinates: points, centroid: centroid);
        farmLocation = FarmLocation(
            type: 'Point',
            coordinates: [centroidLatLng.latitude, centroidLatLng.longitude]);
      }

      final farm = FarmDetails(
        plot: plot,
        location: farmLocation!,
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
        result = await ref
            .read(farmRepoProvider)
            .editOtherFarm(
          farmerName: _farmerNameController.text.trim(),
            mobileNo: _mobileNoController.text.trim(),
            farm: farm, crops: crops, farmId: widget.farmEntity.id);

      } else{
        result = await ref
            .read(farmRepoProvider)
            .editFarm(farm: farm, crops: crops, farmId: widget.farmEntity.id);
      }
      if (result) {
        successDialog(
          context,
          message: "Farm Edited Successfully",
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
            context.router.pop();
          },
        );
      } else {
        failDialog(context);
      }
    }
  }

  @override
  void initState() {
    initalizing().then((value){
      if(context.mounted){
        setState(() {
          loading = false;
        });
      }
    });
    super.initState();
  }

  Future<void> initalizing() async {


    if(widget.isOthers){
      _farmerNameController.text = widget.farmEntity.farmerName;
      _mobileNoController.text = widget.farmEntity.mobileNo;

    }
    final list = widget.farmEntity.cropDetails;
    final farmDetails = widget.farmEntity.farmDetails;
    _farmNameController.text = farmDetails.farmName;
    _areaController.text = farmDetails.farmArea.toString();
    _locationController.text = farmDetails.address;
    _selectedFarmStatus = farmDetails.farmStatus.toTitleCase();
    _selectedIrrigation = farmDetails.irrigation.status;

    if(widget.farmEntity.farmDetails.plot != null){
      plot = widget.farmEntity.farmDetails.plot;
    }
    farmLocation = widget.farmEntity.farmDetails.location;

    if (list.isNotEmpty) {
      for (int i = 0; i < list.length; i++) {
        addCrop(i);
      }
    }
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
          'Edit Farm',
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
      body: loading ? Center(child: CircularProgressIndicator(),):SafeArea(
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
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(30)
                          ],
                        ),
                        10.verticalSpace,
                        AppTextField(
                          textController: _areaController,
                          hintText: "Fam Area (acre)",
                          maxlines: 1,
                          keyboardType: TextInputType.number,
                          validator: (value) => Validate.empty(value!),
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
                            if(context.mounted){
                              showLoading(context);
                            }
                            ref.read(currentCoordinateProvider.notifier).state =
                                [
                              widget.farmEntity.farmDetails.location.coordinates
                                  .first,
                              widget.farmEntity.farmDetails.location.coordinates
                                  .last
                            ];
                            ref.read(currentAreaProvider.notifier).initArea(
                                widget.farmEntity.farmDetails.location
                                    .coordinates.first,
                                widget.farmEntity.farmDetails.location
                                    .coordinates.last);
                            setState(() {});
                            List<Point> points = [];
                            if (widget.farmEntity.farmDetails.plot != null) {
                              points = widget
                                  .farmEntity.farmDetails.plot!.coordinates;
                            }

                            if(context.mounted){
                              Navigator.pop(context);
                            }

                            context.router
                                .push(ChooseFarmLocationRoute(
                                    polyGonList: points))
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
                                    addCrop(null);
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
                                  content: Center(
                                      child: Text(
                                          "Irrigation Status is required*"))));
                        } else {
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
