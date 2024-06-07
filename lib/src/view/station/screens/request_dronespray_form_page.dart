import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/controller/farm/farm_list_controller.dart';
import 'package:kisaan_station/src/l10n/l10n.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';
import 'package:kisaan_station/src/view/widget/snackbar.dart';
import 'package:kisaan_station/src/view/widget/textfield_widget.dart';

import '../../../../global_providers.dart';
import '../../../controller/drawer/station_partner_controller.dart';
import '../../../infrastructure/http/app_exception.dart';
import '../../../model/station/my_station_services_drone_spray_model.dart';
import '../../../util/custom_drop_down_button.dart';
import '../../../util/text_validation/text_validation.dart';

@RoutePage()
class RequestDroneSprayFormPage extends ConsumerStatefulWidget {
  const RequestDroneSprayFormPage({
    Key? key,
    required this.stationId,
  }) : super(key: key);
  final String stationId;

  @override
  _RequestDroneSprayFormPageState createState() =>
      _RequestDroneSprayFormPageState();
}

class _RequestDroneSprayFormPageState
    extends ConsumerState<RequestDroneSprayFormPage> {
  final TextEditingController _farmNameController = TextEditingController();
  final TextEditingController _farmLocationController = TextEditingController();
  final TextEditingController _cropNameController = TextEditingController();
  final TextEditingController _sprayProductEditingController =
      TextEditingController();
  final TextEditingController _mobileeditingController =
      TextEditingController();
  final TextEditingController _dateoftraveleditingController =
      TextEditingController();
  final TextEditingController _locationTextEditingController =
      TextEditingController();
  final TextEditingController _timeoftraveleditingController =
      TextEditingController();
  final TextEditingController _farmDetailsTextEditingController =
      TextEditingController();
  final TextEditingController _farmUnitTextEditingController =
      TextEditingController();
  final TextEditingController _totalFarmArea =
      TextEditingController();
  final TextEditingController _sprayArea =
  TextEditingController();
  bool _isDateValid = true;
  double _price = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _farmUnitTextEditingController.text = "acre";
  }

  TimeOfDay selectedTime = TimeOfDay.now();
  final List<FarmDetailModel> _farmDetailList = [];
  final List<double> _priceList = [];

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: primary, // header background color
              onPrimary: Colors.black, // header text color
              onSurface: primary, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    setState(() {
      selectedTime = timeOfDay!;
      _timeoftraveleditingController.text = selectedTime.format(context);
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      firstDate: DateTime(2022, DateTime.now().month),
      lastDate: DateTime(2025),
      initialDate: DateTime.now(),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
        _dateoftraveleditingController.text =
            "${selectedDate?.day}/${selectedDate?.month}/${selectedDate?.year}";
      });
    }
    validateDate();
  }

  bool validateDate() {
    setState(() {
      _isDateValid = selectedDate != null;
    });
    return _isDateValid;
  }

  DateTime? selectedDate;
  String selectedCropName = "Select Crop";

  double sprayArea = 0.0;

  double lat = 0.0;
  double lng = 0.0;

  List<String> cropNameList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: const Text(
          'Add Details',
          style: TextStyle(color: primary, fontSize: 18),
        ),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.close,
              ))
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: pagePadding,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.personal_detail),
                      AppTextField(
                        hintText: AppLocalizations.of(context)!.farmer_name,
                        textController: _farmNameController,
                        maxlines: 1,
                        textCapitalization: TextCapitalization.words,
                        validator: (value) =>
                            Validate.minLength(value: value!, minLen: 3),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(24),
                        ],
                      ),
                      12.verticalSpace,
                      AppTextField(
                        hintText: AppLocalizations.of(context)!.phone_number,
                        textController: _mobileeditingController,
                        validator: (value) => Validate.phone(value!),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                      ),
                      12.verticalSpace,
                      Text(AppLocalizations.of(context)!.booking_period),
                      15.verticalSpace,
                      TextFormField(
                        readOnly: true,
                        onTap: () async {
                          await _selectDate(context);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Date is required';
                          } else {
                            return null;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _dateoftraveleditingController,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          // color: const Color(0xffA19DA1),
                        ),
                        decoration: InputDecoration(
                          // isCollapsed: true,
                          isDense: true,
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0.r),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: const BorderSide(
                              color: Color(0xffEAEAEA),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 10.w),
                          hintText: AppLocalizations.of(context)!.select_date,
                          suffixIconConstraints:
                              BoxConstraints(maxHeight: 20.h),

                          // suffix: Icon(Icons.calendar_month),
                          suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: const Icon(
                                Icons.calendar_month,
                                color: grey,
                              )),
                        ),
                      ),
                      12.verticalSpace,
                      Text(AppLocalizations.of(context)!.select_time),
                      12.verticalSpace,
                      TextFormField(
                        readOnly: true,
                        onTap: () async {
                          selectTime(context);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Time is required';
                          } else {
                            return null;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _timeoftraveleditingController,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          // color: const Color(0xffA19DA1),
                        ),
                        decoration: InputDecoration(
                          // isCollapsed: true,
                          isDense: true,
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0.r),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: const BorderSide(
                              color: Color(0xffEAEAEA),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 10.w),
                          hintText: selectedTime == null
                              ? _timeoftraveleditingController.text
                              : AppLocalizations.of(context)!.select_time,
                          suffixIconConstraints:
                              BoxConstraints(maxHeight: 20.h),

                          // suffix: Icon(Icons.calendar_month),
                          suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: const Icon(
                                Icons.schedule,
                                color: grey,
                              )),
                        ),
                      ),
                      12.verticalSpace,
                      const Text("Select Farm"),
                      12.verticalSpace,
                      Consumer(builder: (context, ref, child) {
                        return AppTextField(
                          hintText: "Select Farm",
                          readOnly: true,
                          onTap: () {
                            context.router
                                .push(const SelectFarmRoute())
                                .then((value) {
                              final farmEntity = ref.read(farmEntityProvider);
                              if (farmEntity != null) {
                                _farmNameController.text =
                                    farmEntity.farmDetails.farmName;
                                _farmLocationController.text =
                                    farmEntity.farmDetails.address;

                                lat = farmEntity.farmDetails.location.coordinates.first;
                                lng = farmEntity.farmDetails.location.coordinates.last;

                                _totalFarmArea.text =
                                    farmEntity.farmDetails.farmArea.toString();
                                cropNameList.clear();
                                selectedCropName = "Select Crop";
                                    for (final element in farmEntity.cropDetails) {
                                      cropNameList.add(element.nameOfCrop);
                                    }
                                    setState(() {});
                              }
                            });
                          },
                          suffixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: SvgPicture.asset('assets/images/my_farm.svg')),
                        );
                      }),
                      12.verticalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Farm Name'),
                          5.verticalSpace,
                          AppTextField(
                            textController: _farmNameController,
                            readOnly: true,
                            hintText: "Farm Name",
                          ),
                        ],
                      ),
                      12.verticalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Farm Location'),
                          5.verticalSpace,
                          AppTextField(
                            textController: _farmLocationController,
                            readOnly: true,
                            hintText: "Farm Location",
                          ),
                        ],
                      ),
                      12.verticalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Farm Total Area (acre)'),
                          5.verticalSpace,
                          AppTextField(
                            textController: _totalFarmArea,
                            readOnly: true,
                            hintText: "Farm Total Area (acre)",
                          ),
                        ],
                      ),
                      12.verticalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Crop Spray Area (acre)'),
                          5.verticalSpace,
                          AppTextField(
                            textController: _sprayArea,
                            hintText: "Crop Spray Area (acre)",
                            validator: (value){
                              final sprayArea = double.tryParse(value ?? "")??0.0;
                              final totalArea = double.tryParse(_totalFarmArea.text)??0.0;
                              if(sprayArea > totalArea){
                                return "Spray Area can not be Greater than total farm area.";
                              } else{
                                return null;
                              }
                            },
                            onChanged: (value){
                              final temp = double.tryParse(value);
                              if(temp!=null){
                                sprayArea = temp;
                              }

                            },
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                      12.verticalSpace,
                      const Text(
                        'Crop Name',
                      ),
                      12.verticalSpace,
                      CustomDropDownButton(
                        onChanged: (value){
                          setState(() {
                            selectedCropName = value;
                          });
                        },
                          items: cropNameList,
                          selectedItem: selectedCropName,
                          hintText: "Select Crop"),
                      12.verticalSpace,
                      Text(AppLocalizations.of(context)!.spray_product),
                      12.verticalSpace,
                      AppTextField(
                        hintText:
                            AppLocalizations.of(context)!.spray_product_name,
                        textController: _sprayProductEditingController,
                        maxlines: 2,
                        textCapitalization: TextCapitalization.words,
                        validator: (value) =>
                            Validate.minLength(value: value!, minLen: 3),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(250),
                        ],
                      ),
                      12.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppLocalizations.of(context)!.estimated_price),
                          Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Text(
                              '₹${sprayArea * 500}',
                              style: TextStyle(
                                  color: const Color(0xffe48912),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              22.verticalSpace,
              Row(
                children: [
                  Consumer(builder: (context, ref, child) {
                    return Expanded(
                      child: ElevatedButton(
                        onPressed: () async {

                          final farmDetail = FarmDetailModel(farmName: _farmNameController.text.trim(), area: double.tryParse(_totalFarmArea.text.trim()) ?? 0.0, areaUnit: 'acre', estimatedPrice: sprayArea * 500);

                          _farmDetailList.add(farmDetail);
                          if (_formKey.currentState!.validate() &&
                              _farmDetailList.isNotEmpty) {
                            final farmLocation = FarmLocationModel(
                                address: _farmLocationController.text,
                                longitude: lng.toString(),
                                latitude: lat.toString());
                            final MyStationDroneSprayFormModel
                                mystationDroneForm =
                                MyStationDroneSprayFormModel(
                                    reqUserId: UserPreferences.userId,
                                    stationId: widget.stationId,
                                    name: _farmNameController.text,
                                    mobileNo: _mobileeditingController.text,
                                    bookingDate:
                                        _dateoftraveleditingController.text,
                                    addFarmDetails: jsonEncode(_farmDetailList),
                                    bookingStartTime:
                                        _timeoftraveleditingController.text,
                                    addFramLocation: jsonEncode(farmLocation),
                                    cropType: selectedCropName,
                                    sparyProduct:
                                        _sprayProductEditingController.text,
                                    estimatedPrice: _priceList.sum);

                            try {
                              debugPrint(mystationDroneForm.stationId);
                              final bookingId = await ref
                                  .read(stationSellRepoProvider)
                                  .droneSprayingFormSubmit(
                                    myStationDroneSprayFormModel:
                                        mystationDroneForm,
                                  );
                              context.router.popAndPush(
                                  SuccessDroneSprayingRoute(
                                      bookingId: bookingId));
                            } on AppException catch (e) {
                              e.whenOrNull(
                                connectivity: () {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      getSnackBar(
                                          "Please check your internet connection"));
                                },
                                errorWithMessage: (message) {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(getSnackBar(message));
                                },
                                error: () {
                                  Navigator.pop(context);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      getSnackBar("Something went wrong"));
                                },
                              );
                            }
                          }
                        },
                        child:
                            Text(AppLocalizations.of(context)!.confirm_request),
                      ),
                    );
                  }),
                ],
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}


