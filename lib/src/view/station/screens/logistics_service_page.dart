import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/controller/station/state/logistic_service_controller.dart';
import 'package:kisaan_station/src/model/station/logistics/service/logistics_service_model.dart';
import 'package:kisaan_station/src/util/text_validation/text_validation.dart';
import 'package:kisaan_station/src/view/widget/dialogs/loading_dialog.dart';

import '../../../../global_providers.dart';
import '../../../app/router/router.gr.dart';
import '../../../constants/colors.dart';
import '../../../controller/drawer/station_partner_controller.dart';
import '../../widget/dialogs/farm_location_dailog.dart';
import '../../widget/snackbar.dart';
import '../../widget/textfield_widget.dart';

enum Trip { oneway, twoway }

@RoutePage()
class LogisticsServicePage extends ConsumerStatefulWidget {
  const LogisticsServicePage({super.key});

  @override
  ConsumerState<LogisticsServicePage> createState() =>
      _LogisticsServicePageState();
}

class _LogisticsServicePageState extends ConsumerState<LogisticsServicePage> {
  String selectedCategory = "Select Vehicle Category";
  List<String> category = ['Passenger', 'Cargo', 'Both'];

  final TextEditingController _startLocationTextController =
      TextEditingController();
  final TextEditingController _dropLocationTextController =
      TextEditingController();
  final TextEditingController _passengersController = TextEditingController();
  final TextEditingController _cargoLoadController = TextEditingController();
  final TextEditingController _lengthController = TextEditingController();
  final TextEditingController _widthController = TextEditingController();

  Trip selectedTrip = Trip.twoway;
  final _formKey = GlobalKey<FormState>();
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
          'Logistics',
          style: TextStyle(color: primary, fontSize: 20.sp),
        ),
      ),
      body: Padding(
        padding: pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: _formKey,
              child: Expanded(
                child: ListView(
                  children: [
                    10.verticalSpace,
                    const Text('Vehicle Category*',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff563e1f),
                            fontWeight: FontWeight.w600)),
                    10.verticalSpace,
                    DropdownButtonHideUnderline(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffF9F9F9),
                          border: Border.all(color: const Color(0xffF4F4F4)),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton(
                            padding: EdgeInsets.symmetric(vertical: 5.h),
                            isExpanded: true,
                            hint: Text(
                              selectedCategory,
                              style:
                                  selectedCategory == "Choose Hal Saathi Type"
                                      ? textTheme.bodyLarge!.copyWith(
                                          color: hintTextColor, fontSize: 12.sp)
                                      : textTheme.bodyLarge!
                                          .copyWith(fontSize: 12.sp),
                            ),
                            items: category
                                .map<DropdownMenuItem>(
                                    (item) => DropdownMenuItem(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: textTheme.bodyLarge!
                                                .copyWith(fontSize: 12.sp),
                                          ),
                                        ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedCategory = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    10.verticalSpace,
                    const Text('No of Passengers',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff563e1f),
                            fontWeight: FontWeight.w600)),
                    10.verticalSpace,
                    AppTextField(
                      hintText: 'Enter No. Of Passengers',
                      textController: _passengersController,
                      validator: (value) => Validate.empty(value!),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(35),
                      ],
                    ),
                    10.verticalSpace,
                    const Text('Cargo Load',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff563e1f),
                            fontWeight: FontWeight.w600)),
                    10.verticalSpace,
                    AppTextField(
                      hintText: 'Enter Cargo Load',
                      textController: _cargoLoadController,
                      keyboardType: TextInputType.streetAddress,
                      validator: (value) => Validate.empty(value!),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(35),
                      ],
                    ),
                    10.verticalSpace,
                    const Text('Cargo Dimensions (foot)',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff563e1f),
                            fontWeight: FontWeight.w600)),
                    10.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: AppTextField(
                            hintText: 'Length',
                            textController: _lengthController,
                            validator: (value) => Validate.empty(value!),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(35),
                            ],
                          ),
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: AppTextField(
                            hintText: 'Width',
                            textController: _widthController,
                            validator: (value) => Validate.empty(value!),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(35),
                            ],
                          ),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    const Text('Trip Location',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff563e1f),
                            fontWeight: FontWeight.w600)),
                    10.verticalSpace,
                    Consumer(builder: (context, ref, child) {
                      return InkWell(
                        onTap: () async {
                          setState(() {
                            showLoading(context);
                          });
                          bool proceed =
                              await ref.read(locationProvider).checkLocation();

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
                            final res =
                                await ref.read(locationProvider).getLocation();
                            if (res == null) return;
                            ref.read(currentCoordinateProvider.notifier).state =
                                [res.latitude!, res.longitude!];
                            ref.read(currentAreaProvider.notifier).initArea(
                                  res.latitude!,
                                  res.longitude!,
                                );

                            setState(() {
                              context.router.pop();
                            });

                            context.router
                                .push(ChooseLogisticLocationRoute(
                                    fromAddNewAddress: false))
                                .then((value) => {
                                      _dropLocationTextController.text = ref.read(
                                          stationPartnerAddressStringProvider)
                                    });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 15.h),
                          decoration: BoxDecoration(
                            color: const Color(0xffF9F9F9),
                            borderRadius: BorderRadius.circular(10.r),
                            // border: Border.all(color: primary)
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Choose Trip Location',
                                style: TextStyle(
                                    color: primary,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                              Icon(
                                Icons.gps_fixed_outlined,
                                color: primary,
                              )
                            ],
                          ),
                        ),
                      );
                    }),

                    Consumer(
                      builder: (context, ref, child) {
                        final startLocation =
                            ref.watch(tripStartLocationProvider);
                        _startLocationTextController.text =
                            startLocation?.address ?? "";
                        final destinationLocation =
                            ref.watch(tripDropLocationProvider);
                        _dropLocationTextController.text =
                            destinationLocation?.address ?? "";
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.verticalSpace,
                            const Text('Start Point',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff563e1f),
                                    fontWeight: FontWeight.w600)),
                            10.verticalSpace,
                            AppTextField(
                              readOnly: true,
                              hintText: 'Start Point',
                              textController: _startLocationTextController,
                              keyboardType: TextInputType.streetAddress,
                            ),
                            10.verticalSpace,
                            const Text('Drop Point',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff563e1f),
                                    fontWeight: FontWeight.w600)),
                            10.verticalSpace,
                            AppTextField(
                                readOnly: true,
                                textController: _dropLocationTextController,
                                hintText: 'Drop Point',
                                keyboardType: TextInputType.streetAddress),
                          ],
                        );
                      },
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        Radio(
                            value: Trip.oneway,
                            groupValue: selectedTrip,
                            onChanged: (value) {
                              setState(() {
                                selectedTrip = Trip.oneway;
                              });
                            }),
                        const Text('One-Way'),
                        Radio(
                            value: Trip.twoway,
                            groupValue: selectedTrip,
                            onChanged: (value) {
                              setState(() {
                                selectedTrip = Trip.twoway;
                              });
                            }),
                        const Text('Two-Way'),
                      ],
                    ),
                    20.verticalSpace,
                    // Consumer(
                    //   builder: (context,ref,child){
                    //
                    //   },
                    // )
                  ],
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (selectedCategory == "Select Vehicle Category") {
                      ScaffoldMessenger.of(context).showSnackBar(
                          getSnackBar("Please select vehicle category"));
                    } else {
                      final cargoDimensions = CargoDimension(
                          length: _lengthController.text.trim(),
                          width: _widthController.text.trim());

                      final startLocation = ref.read(tripStartLocationProvider);
                      final dropLocation = ref.read(tripDropLocationProvider);

                        final model = BookLogisticsModel(
                          vehicleCategory: selectedCategory,
                          passengersCount: _passengersController.text.trim(),
                          cargoLoad: _cargoLoadController.text.trim(),
                          tripType: selectedTrip.name,
                          startPointLocation: startLocation!,
                          dropPointLocation: dropLocation!,
                          cargoDimension: cargoDimensions);


                    }
                  }

                  ref.read(tripStartLocationProvider.notifier).state = null;
                  ref.read(tripDropLocationProvider.notifier).state = null;
                  context.router.pop();
                },
                child: const Text('Continue'))
          ],
        ),
      ),
    );
  }
}
