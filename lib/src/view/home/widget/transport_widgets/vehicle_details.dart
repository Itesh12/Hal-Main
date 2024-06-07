import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/controller/station/upload_logistics_controller.dart';
import 'package:kisaan_station/src/infrastructure/repository/station/sell/upload_logistic_repo.dart';
import 'package:kisaan_station/src/util/text_validation/text_validation.dart';
import 'package:kisaan_station/src/view/widget/dialogs/loading_dialog.dart';
import 'package:reorderable_grid/reorderable_grid.dart';

import '../../../../../global_providers.dart';
import '../../../../constants/colors.dart';
import '../../../../model/station/logistics/sell/upload_logistics_model.dart';
import '../../../../util/custom_dotted_container.dart';
import '../../../../util/image_picker/image_picker.dart';
import '../../../widget/textfield_widget.dart';

class VehicleDetails extends ConsumerStatefulWidget {
  const VehicleDetails({
    super.key,
  });

  @override
  ConsumerState<VehicleDetails> createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends ConsumerState<VehicleDetails> {
  String selectedCategory = "Select Vehicle Category";
  List<String> category = ['Passenger', 'Cargo', 'Both'];

  String selectedBody = "Select Vehicle Body";
  List<String> bodyType = [
    'Truck',
    'Pickup',
    'Mini Truck',
    'Tripper',
    'Trailer',
    '3 Wheeler',
    'Transit Mixer',
    'Auto Rickshaw',
    'E Rickshaw',
    'Other'
  ];

  String selectedFuelType = "Select Fuel Type";
  List<String> fuelType = [
    'Electric',
    'Petrol',
    'Diesel',
    'CNG',
    'LPG',
    'Hybrid'
  ];

  String selectedLoadCapacity = 'Select Load Capacity';
  List<String> loadCapacity = [
    '50 kgs - 100 kgs',
    '100 kgs - 150 kgs',
    '150 kgs - 300 kgs',
    '500 + kg',
    '1000 + kg',
    '2000 + kg',
    '5000 + kg',
    'Other'
  ];

  String selectedBrand = 'Select Brand';
  List<String> brand = [
    'Isuzu',
    'Tata Motors',
    'Mahindra',
    'Ford',
    'Eicher',
    'Volvo',
    'Ashok Leyland',
    'Bajaj',
    'Other'
  ];

  String selectedTravelledDistance = 'Select Distance Travelled';
  List<String> travelledDistance = [
    '0 km - 100 km',
    '100 km - 500 km',
    '1000 km - 2000 km',
    '2000 km +',
    '4000 km + ',
    'Other'
  ];

  String selectedTrips = 'Select No. of Trips per month';
  List<String> trips = [
    '0 - 20',
    '21 - 40',
    '41 - 60',
    '61 - 80',
    '81 - 100',
    '100 +',
    'Other'
  ];

  final TextEditingController modelController = TextEditingController();

  final TextEditingController variantController = TextEditingController();

  final TextEditingController purchasedYearController = TextEditingController();

  final TextEditingController registrationNumberController =
      TextEditingController();

  List<String> hintTexts = [
    "Select Vehicle Category",
    "Select Vehicle Body",
    "Select Fuel Type",
    'Select Load Capacity',
    'Select Brand',
    "Select Distance Travelled",
    'Select No. of Trips per month'
  ];

  @override
  void initState() {
    final vehicleDetails = ref.read(logisticsVehicleDetailsProvider);

    selectedCategory = vehicleDetails?.category ?? hintTexts[0];
    selectedBody = vehicleDetails?.vehicleType ?? hintTexts[1];
    selectedFuelType = vehicleDetails?.fuelType ?? hintTexts[2];
    selectedLoadCapacity = vehicleDetails?.loadCapacity ?? hintTexts[3];
    selectedBrand = vehicleDetails?.brand ?? hintTexts[4];

    modelController.text = vehicleDetails?.model ?? "";
    variantController.text = vehicleDetails?.varient ?? "";
    purchasedYearController.text = vehicleDetails?.purchasedYear ?? "";
    registrationNumberController.text = vehicleDetails?.regNo ?? "";

    selectedTravelledDistance =
        vehicleDetails?.distanceTravelled ?? hintTexts[5];

    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Form(
          key: _formKey,
          child: Expanded(
            child: ListView(
              children: [
                const Text('Vehicle Details',
                    style: TextStyle(
                        fontSize: 16,
                        color: primary,
                        fontWeight: FontWeight.w600)),
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
                          style: selectedCategory == hintTexts[0]
                              ? textTheme.bodyLarge!.copyWith(
                                  color: hintTextColor, fontSize: 12.sp)
                              : textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                        ),
                        items: category
                            .map<DropdownMenuItem>((item) => DropdownMenuItem(
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
                const Text('Vehicle Body Type*',
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
                          selectedBody,
                          style: selectedBody == "Select Vehicle Body"
                              ? textTheme.bodyLarge!.copyWith(
                                  color: hintTextColor, fontSize: 12.sp)
                              : textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                        ),
                        items: bodyType
                            .map<DropdownMenuItem>((item) => DropdownMenuItem(
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
                            selectedBody = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                if (selectedBody == 'Other')
                  Column(
                    children: [
                      10.verticalSpace,
                      AppTextField(
                        validator: selectedBody == 'Other'
                            ? (value) => Validate.empty(value!)
                            : null,
                        hintText: 'Please Specify',
                        onChanged: (val) {
                          selectedBody = val;
                        },
                      )
                    ],
                  ),
                10.verticalSpace,
                const Text('Vehicle Fuel Type*',
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
                          selectedFuelType,
                          style: selectedFuelType == "Select Fuel Type"
                              ? textTheme.bodyLarge!.copyWith(
                                  color: hintTextColor, fontSize: 12.sp)
                              : textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                        ),
                        items: fuelType
                            .map<DropdownMenuItem>((item) => DropdownMenuItem(
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
                            selectedFuelType = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                if (selectedFuelType == 'Other')
                  Column(
                    children: [
                      10.verticalSpace,
                      AppTextField(
                        validator: selectedFuelType == 'Other'
                            ? (value) => Validate.empty(value!)
                            : null,
                        hintText: 'Please Specify',
                        onChanged: (val) {

                            selectedFuelType = val;

                        },
                      )
                    ],
                  ),
                10.verticalSpace,
                const Text('Load Capacity*',
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
                          selectedLoadCapacity,
                          style: selectedLoadCapacity == "Select Load Capacity"
                              ? textTheme.bodyLarge!.copyWith(
                                  color: hintTextColor, fontSize: 12.sp)
                              : textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                        ),
                        items: loadCapacity
                            .map<DropdownMenuItem>((item) => DropdownMenuItem(
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
                             selectedLoadCapacity = value;
                           });

                        },
                      ),
                    ),
                  ),
                ),
                if (selectedLoadCapacity == 'Other')
                  Column(
                    children: [
                      10.verticalSpace,
                      AppTextField(
                        validator: selectedLoadCapacity == 'Other'
                            ? (value) => Validate.empty(value!)
                            : null,
                        hintText: 'Please Specify',
                        onChanged: (val) {

                            selectedBody = val;

                        },
                      )
                    ],
                  ),
                10.verticalSpace,
                const Text('Brand*',
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
                          selectedBrand,
                          style: selectedBrand == "Select Brand"
                              ? textTheme.bodyLarge!.copyWith(
                                  color: hintTextColor, fontSize: 12.sp)
                              : textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                        ),
                        items: brand
                            .map<DropdownMenuItem>((item) => DropdownMenuItem(
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
                              selectedBrand = value;
                            });

                        },
                      ),
                    ),
                  ),
                ),
                if (selectedBrand == 'Other')
                  Column(
                    children: [
                      10.verticalSpace,
                      AppTextField(
                        validator: selectedBrand == 'Other'
                            ? (value) => Validate.empty(value!)
                            : null,
                        hintText: 'Please Specify',
                        onChanged: (val) {
                            selectedBrand = val;
                        },
                      )
                    ],
                  ),
                10.verticalSpace,
                const Text('Model*',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Enter Model',
                  keyboardType: TextInputType.streetAddress,
                  validator: (value) => Validate.empty(value!),
                  textController: modelController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(35),
                  ],
                ),
                10.verticalSpace,
                const Text('Variant*',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Enter Variant',
                  keyboardType: TextInputType.streetAddress,
                  validator: (value) => Validate.empty(value!),
                  textController: variantController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(35),
                  ],
                ),
                10.verticalSpace,
                const Text('Purchased Year*',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Enter Purchased Year',
                  keyboardType: TextInputType.number,
                  textController: purchasedYearController,
                  validator: (value) => Validate.number(value!, 4),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(4),
                  ],
                ),
                10.verticalSpace,
                const Text('Registration Number*',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Enter Registration Number',
                  keyboardType: TextInputType.visiblePassword,
                  textController: registrationNumberController,
                  validator: (value) => Validate.empty(value!),
                ),
                10.verticalSpace,
                const Text('No of Distance Travelled Till now',
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
                          selectedTravelledDistance,
                          style: selectedTravelledDistance ==
                                  "Select Distance Travelled"
                              ? textTheme.bodyLarge!.copyWith(
                                  color: hintTextColor, fontSize: 12.sp)
                              : textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                        ),
                        items: travelledDistance
                            .map<DropdownMenuItem>((item) => DropdownMenuItem(
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
                            selectedTravelledDistance = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                if (selectedTravelledDistance == 'Other')
                  Column(
                    children: [
                      10.verticalSpace,
                      AppTextField(
                        validator: selectedTravelledDistance == 'Other'
                            ? (value) => Validate.empty(value!)
                            : null,
                        hintText: 'Please Specify',
                        onChanged: (val) {
                          selectedTravelledDistance = val;
                        },
                      )
                    ],
                  ),
                10.verticalSpace,
                const Text('Vehicle Photos',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                CustomLogisticsImageGrid(provider: 'vehicle')
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: grey),
                    onPressed: () {
                      ref.read(currentIndexProvider.notifier).state = 1;
                    },
                    child: const Text('Back')),
              ),
              10.horizontalSpace,
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      if (selectedCategory == hintTexts[0] ||
                          selectedBody == hintTexts[1] ||
                          selectedFuelType == hintTexts[2] ||
                          selectedLoadCapacity == hintTexts[3] ||
                          selectedBrand == hintTexts[4] ||
                          selectedTravelledDistance == hintTexts[5]) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: primary,
                                content:
                                    Text("Please fill all required fields.")));
                      } else if (ref.read(vehicleImageListProvider).isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: primary,
                                content: Text("Add Vehicle Image.")));
                      } else if (_formKey.currentState!.validate()) {
                        final vehicleDetails = VehicleDetailsModel(
                            category: selectedCategory,
                            vehicleType: selectedBody,
                            fuelType: selectedFuelType,
                            loadCapacity: selectedLoadCapacity,
                            brand: selectedBrand,
                            model: modelController.text.trim(),
                            varient: variantController.text.trim(),
                            purchasedYear: purchasedYearController.text.trim(),
                            regNo: registrationNumberController.text.trim(),
                            distanceTravelled: selectedTravelledDistance);

                        ref
                            .read(logisticsVehicleDetailsProvider.notifier)
                            .state = vehicleDetails;
                        ref.read(currentIndexProvider.notifier).state = 3;
                      }
                      // if(selectedCategory == null || selectedBody == null)
                    },
                    child: const Text('Continue')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomLogisticsImageGrid extends ConsumerStatefulWidget {
  const CustomLogisticsImageGrid(
      {this.hintText = "", this.length = 6, required this.provider, super.key});

  final String hintText;
  final int length;
  final String provider;

  @override
  ConsumerState<CustomLogisticsImageGrid> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends ConsumerState<CustomLogisticsImageGrid> {
  setToProviders(List<File> _pickedImages) {
    if (widget.provider == 'vehicle') {
      ref.read(vehicleImageListProvider.notifier).state = _pickedImages;
    } else if (widget.provider == 'aadhaar') {
      ref.read(aadhaarImageListProvider.notifier).state = _pickedImages;
    } else if (widget.provider == 'pan') {
      ref.read(panImageListProvider.notifier).state = _pickedImages;
    } else if (widget.provider == 'rc') {
      ref.read(rcImageListProvider.notifier).state = _pickedImages;
    } else if (widget.provider == 'dl') {
      ref.read(dlImageListProvider.notifier).state = _pickedImages;
    } else if (widget.provider == 'insurance') {
      ref.read(insuranceImageListProvider.notifier).state = _pickedImages;
    } else if (widget.provider == 'puc') {
      ref.read(pucImageListProvider.notifier).state = _pickedImages;
    }
  }

  final List<File> _pickedImages = [];
  Future<void> chooseImage({required bool isCamera}) async {
    File? pickedFile;
    if (isCamera) {
      pickedFile = await ref.read(mediaProvider).captureMedia();
    } else {
      pickedFile = await ref.read(mediaProvider).pickImage();
    }
    if (pickedFile != null) {
      _pickedImages.add(pickedFile);
      setToProviders(_pickedImages);
      setState(() {});
    }
  }

  Future<void> chooseMultiImage({required int imageCount}) async {
    final pickedFile = await ref
        .read(mediaProvider)
        .pickMultiImage(count: imageCount, context: context);

    if (pickedFile.isNotEmpty) {
      _pickedImages.addAll(pickedFile);
      if (widget.provider == 'vehicle') {
        ref.read(vehicleImageListProvider.notifier).state = _pickedImages;
        setToProviders(_pickedImages);
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    if (widget.provider == 'vehicle') {
      ref.read(vehicleImageListProvider).forEach((element) {
        _pickedImages.add(element);
      });
    } else if (widget.provider == 'aadhaar') {
      ref.read(aadhaarImageListProvider).forEach((element) {
        _pickedImages.add(element);
      });
    } else if (widget.provider == 'pan') {
      ref.read(panImageListProvider).forEach((element) {
        _pickedImages.add(element);
      });
    } else if (widget.provider == 'rc') {
      ref.read(rcImageListProvider).forEach((element) {
        _pickedImages.add(element);
      });
    } else if (widget.provider == 'dl') {
      ref.read(dlImageListProvider).forEach((element) {
        _pickedImages.add(element);
      });
    } else if (widget.provider == 'insurance') {
      ref.read(insuranceImageListProvider).forEach((element) {
        _pickedImages.add(element);
      });
    } else if (widget.provider == 'puc') {
      ref.read(pucImageListProvider).forEach((element) {
        _pickedImages.add(element);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
        decoration: InputDecoration(
          labelText: widget.hintText != ""
              ? widget.hintText
              : 'Add photo (${_pickedImages.length}/6)',
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: black400),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: black400),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: orangePrimary),
              borderRadius: BorderRadius.circular(15)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: orangePrimary),
              borderRadius: BorderRadius.circular(15)),
          filled: true,
          fillColor: black100,
        ),
        child: ReorderableGridView.extent(
          shrinkWrap: true,
          maxCrossAxisExtent: widget.hintText == "" ? 100.h : double.infinity,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: widget.hintText == "" ? 1.0 : 1.5,
          onReorder: (oldImage, newImage) {
            setState(() {
              final _reorderedImage = _pickedImages.removeAt(oldImage);
              _pickedImages.insert(newImage, _reorderedImage);
              // setToProviders(_pickedImages);
            });
          },
          children: [
            for (final item in _pickedImages)
              SizedBox(
                key: ValueKey(item),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          item,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5.w,
                      top: 5.h,
                      child: InkWell(
                        onTap: () {
                          _pickedImages.remove(item);
                          setToProviders(_pickedImages);
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: orange100,
                              border: Border.all(color: orange800),
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.close,
                            color: brownColor,
                            size: MediaQuery.of(context).size.height * 0.019,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            if (_pickedImages.length <= (widget.length - 1))
              SizedBox(
                key: const ValueKey('AddImage'),
                child: InkWell(
                  onTap: _pickedImages.length == 4
                      ? null
                      : () async {
                          final isCamera = await ref
                              .read(mediaProvider)
                              .chooseSource(context);
                          if (isCamera != null) {
                            if (isCamera) {
                              chooseImage(isCamera: isCamera);
                              setState(() {});
                            } else {
                              final length =
                                  widget.length - _pickedImages.length;
                              if (widget.length == 1) {
                                chooseImage(
                                  isCamera: false,
                                );
                              } else {
                                chooseMultiImage(imageCount: length);
                              }
                              setState(() {});
                            }
                          }
                        },
                  child: const CustomDottedBox(
                      height: double.infinity,
                      child: Icon(
                        Icons.add,
                        color: orangePrimary,
                      )),
                ),
              ),
          ],
        ));
  }
}
