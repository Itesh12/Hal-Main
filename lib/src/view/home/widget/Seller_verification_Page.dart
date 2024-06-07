import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';

import '../../../app/router/router.gr.dart';
import '../../../controller/drawer/station_partner_controller.dart';
import '../../../controller/station/my_station_controller.dart';
import '../../../infrastructure/http/app_exception.dart';
import '../../../l10n/l10n.dart';
import '../../../model/drawer/station_partner_form_model.dart';
import '../../../model/station/seller_Verification_model.dart';
import '../../../util/image_picker/image_picker.dart';
import '../../../util/services/shared_preferences.dart';
import '../../../util/text_validation/text_validation.dart';
import '../../station/widgets/station_card.dart';
import '../../widget/dialogs/farm_location_dailog.dart';
import '../../widget/dialogs/loading_dialog.dart';
import '../../widget/snackbar.dart';
import '../../widget/textfield_widget.dart';

@RoutePage()
class SellerVericationPage extends ConsumerStatefulWidget {
  const SellerVericationPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SellerVericationPageState();
}

class _SellerVericationPageState extends ConsumerState<SellerVericationPage> {
  final _formKey = GlobalKey<FormState>();

  int ttlNoOfDrones = 0;
  final List<File?> _pickedImages = [null, null];

  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _descriptionTextEditingController =
      TextEditingController();
  final TextEditingController _referralCodeController = TextEditingController();
  final TextEditingController _locationTextEditingController = TextEditingController();


  Future<void> chooseImage({required bool isCamera, required int index}) async {
    File? pickedFile;
    if (isCamera) {
      pickedFile = await ref.read(mediaProvider).captureMedia();
    } else {
      pickedFile = await ref.read(mediaProvider).pickImage();
    }
    if (pickedFile != null) {
      _pickedImages.insert(index, pickedFile);
      setState(() {});
    }
  }

  // Future<void> chooseMultiImage({required int imageCount}) async {
  //   final pickedFile =
  //       await ref.read(mediaProvider).pickMultiImage(count: imageCount);

  //   if (pickedFile.isNotEmpty) {
  //     _pickedImages.insertAll( index , pickedFile);
  //     setState(() {});
  //   }
  // }



  @override
  void dispose() {
    _nameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _descriptionTextEditingController.dispose();

    super.dispose();
  }
  String selectedCategory = "Choose Hal Saathi Type";
  List<String> type = [
    "Pro",
    "Farmer",
    "Retailer",
    "Brand",
    "Logistics",
    "Self Employed",
    "Government",
  ];

  String dcId = "";
  String dcName = "";
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => {
                  context.router.replaceAll([const KisaanHomeRoute()])
                },
            icon: const Icon(
              Icons.close,
            )),
        centerTitle: true,
        title: Text(
          "Hal Saathi Verification",
          style: TextStyle(
            fontSize: 20.sp,
            color: primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: pagePadding,
        child: Column(
          children: [
            10.verticalSpace,
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/personalcard.svg',
                  height: 24,
                  width: 24,
                ),
                10.horizontalSpace,
                const Text(
                  'Register yourself to become a Hal Saathi',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff563e1f)),
                ),
              ],
            ),
            20.verticalSpace,
            Expanded(
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   height: 98.h,
                  //   // width: 159.w,
                  //   decoration: BoxDecoration(
                  //       color: const Color(0xfff5f5f5),
                  //       borderRadius: BorderRadius.all(Radius.circular(13.r)),
                  //       border: Border.all(color: const Color(0xfff5f5f5))),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(10.0),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         SizedBox(
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 UserPreferences.userId,
                  //                 textAlign: TextAlign.start,
                  //                 style: const TextStyle(
                  //                     color: const Color(0xff563e1f),
                  //                     fontSize: 12,
                  //                     fontWeight: FontWeight.w500),
                  //               ),
                  //               Text(
                  //                 UserPreferences.userName,
                  //                 textAlign: TextAlign.start,
                  //                 style: const TextStyle(
                  //                     color: Color(0xff563e1f),
                  //                     fontSize: 12,
                  //                     fontWeight: FontWeight.w500),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           height: 80,
                  //           width: 80,
                  //           child: IconButton(
                  //             onPressed: () {},
                  //             icon: ProfilePicWidget(
                  //               url: UserPreferences.profilePic,
                  //               // size: 100,
                  //               fizedSize: true,
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // 15.verticalSpace,
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Full Name/ Company Name *',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff563e1f)),
                        ),
                        10.verticalSpace,
                        AppTextField(
                          hintText: 'Enter your Full Name',
                          textController: _nameTextEditingController,
                          maxlines: 1,
                          textCapitalization: TextCapitalization.words,
                          validator: (value) =>
                              Validate.minLength(value: value!, minLen: 3),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(24),
                          ],
                        ),
                        15.verticalSpace,
                        const Text(
                          'Hal Saathi Type*',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff563e1f)),
                        ),
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
                                items: type
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
                        15.verticalSpace,
                        const Text(
                          'E-mail *',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff563e1f)),
                        ),
                        10.verticalSpace,
                        AppTextField(
                          hintText: 'Enter your email ',
                          textController: _emailTextEditingController,
                          validator: (value) => Validate.email(value!),
                          keyboardType: TextInputType.emailAddress,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(70),
                          ],
                        ),
                        15.verticalSpace,
                        Text(
                          'Add Business Details*',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff563e1f)),
                        ),
                        10.verticalSpace,
                        AppTextField(
                          maxlines: 4,
                          hintText: 'Write Text Here',
                          textController: _descriptionTextEditingController,
                          validator: (value) =>
                              Validate.minLength(value: value!, minLen: 5),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(600),
                          ],
                        ),
                        10.verticalSpace,
                        const Text(
                          'Location*',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff563e1f)),
                        ),
                        10.verticalSpace,
                        Consumer(builder: (context, ref, child) {
                          return AppTextField(
                            hintText: 'Select Hal Saathi Location ',
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
                                setState(() {
                                  context.router.pop();
                                });

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
                        15.verticalSpace,
                        const Text(
                          'Upload Govt ID *',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff563e1f)),
                        ),
                        15.verticalSpace,
                        Row(
                          children: [
                            InkWell(
                              onTap: () async {
                                final isCamera = await ref
                                    .read(mediaProvider)
                                    .chooseSource(context);
                                if (isCamera != null) {
                                  chooseImage(isCamera: isCamera, index: 0);
                                  setState(() {});
                                }
                              },
                              child: Container(
                                height: 116.h,
                                width: 159.w,
                                decoration: BoxDecoration(
                                    color: const Color(0xfff5f5f5).withOpacity(0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(9.r)),
                                    border:
                                        Border.all(color: const Color(0xffE5E5E5))),
                                child: _pickedImages[0] == null
                                    ? Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              const Text(
                                                'Upload Front Side',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff979797)),
                                              ),
                                              3.verticalSpace,
                                              SvgPicture.asset(
                                                'assets/images/upload_b.svg',
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Image.file(
                                        _pickedImages[0]!,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () async {
                                final isCamera = await ref
                                    .read(mediaProvider)
                                    .chooseSource(context);
                                if (isCamera != null) {
                                  chooseImage(isCamera: isCamera, index: 1);
                                  setState(() {});
                                }
                              },
                              child: Container(
                                height: 116.h,
                                width: 159.w,
                                decoration: BoxDecoration(
                                    color: const Color(0xfff5f5f5).withOpacity(0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(9.r)),
                                    border:
                                        Border.all(color: const Color(0xffE5E5E5))),
                                child: _pickedImages[1] == null
                                    ? Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              const Text(
                                                'Upload Back Side',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff979797)),
                                              ),
                                              3.verticalSpace,
                                              SvgPicture.asset(
                                                'assets/images/upload_b.svg',
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Image.file(
                                        _pickedImages[1]!,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ],
                        ),

                        // GridView.builder(
                        //     shrinkWrap: true,
                        //     physics: const NeverScrollableScrollPhysics(),
                        //     itemCount: _pickedImages.length + 1,
                        //     gridDelegate:
                        //         const SliverGridDelegateWithFixedCrossAxisCount(
                        //             crossAxisCount: 3),
                        //     itemBuilder: (context, index) {
                        //       return index == 0
                        //           ? Column(
                        //               mainAxisAlignment: MainAxisAlignment.center,
                        //               children: [
                        //                 5.verticalSpace,
                        //                 InkWell(
                        //                   onTap: _pickedImages.length == 10
                        //                       ? null
                        //                       : () async {
                        //                           final isCamera = await ref
                        //                               .read(mediaProvider)
                        //                               .chooseSource(context);
                        //                           if (isCamera != null) {
                        //                             if (isCamera) {
                        //                               chooseImage(
                        //                                   isCamera: isCamera);
                        //                               setState(() {});
                        //                             } else {
                        //                               final length =
                        //                                   10 - _pickedImages.length;
                        //                               chooseMultiImage(
                        //                                   imageCount: length);
                        //                               setState(() {});
                        //                             }
                        //                           }
                        //                         },
                        //                   child: Container(
                        //                     height: 116.h,
                        //                     width: 159.w,
                        //                     decoration: BoxDecoration(
                        //                         color: Colors.white,
                        //                         borderRadius: BorderRadius.all(
                        //                             Radius.circular(9.r)),
                        //                         border: Border.all(
                        //                             color:
                        //                                 const Color(0xffE5E5E5))),
                        //                     child: Center(
                        //                       child: SvgPicture.asset(
                        //                         'assets/images/upload_b.svg',
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ],
                        //             )
                        //           : Column(
                        //               crossAxisAlignment: CrossAxisAlignment.end,
                        //               children: [
                        //                 InkWell(
                        //                     onTap: () {
                        //                       _pickedImages.removeAt(index - 1);
                        //                       setState(() {});
                        //                     },
                        //                     child: SvgPicture.asset(
                        //                         'assets/images/remove_icon.svg')),
                        //                 InkWell(
                        //                   onTap: () {
                        //                     Navigator.push(
                        //                         context,
                        //                         MaterialPageRoute(
                        //                           builder: (context) =>
                        //                               ImageViewScreen(
                        //                                   image: _pickedImages[
                        //                                       index - 1]),
                        //                         ));
                        //                   },
                        //                   child: Container(
                        //                     height: 80.w,
                        //                     width: 80.w,
                        //                     margin: const EdgeInsets.all(3),
                        //                     decoration: BoxDecoration(
                        //                         borderRadius: BorderRadius.all(
                        //                             Radius.circular(9.r)),
                        //                         image: DecorationImage(
                        //                             image: FileImage(
                        //                                 _pickedImages[index - 1]),
                        //                             fit: BoxFit.cover)),
                        //                   ),
                        //                 ),
                        //               ],
                        //             );
                        //     }),
                        10.verticalSpace,
                        Column(
                          children: [
                            10.verticalSpace,
                            Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.district_center,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: primary,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    context.router
                                        .push(const SelectKisaanStationListRoute());
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)!.change_center,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: primary,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            Consumer(builder: (context, ref, child) {
                              final res = ref.watch(selectedKisaanStationProvider);
                              return res.when(
                                    (nearByStation) {

                                  dcId = nearByStation.ksId;
                                  dcName = nearByStation.ksName;

                                  return StationCard(
                                    fromList: false,
                                    onTap: () {
                                      setState(() {});
                                    },
                                    name: nearByStation.ksName,
                                    location: nearByStation.ksLocation.address,
                                    distance: nearByStation.distance.toString(),
                                    selectedIndex: 0,
                                    currentIndex: 0,
                                    id: nearByStation.ksId,
                                  );
                                },
                                alreadySelected: () =>
                                    Consumer(builder: (context, ref, child) {
                                      final res = ref.watch(nearByStationList(20));
                                      return res.when(
                                          data: (data) {
                                            if (data.isNotEmpty){
                                              dcId = data[0].ksId;
                                              dcName=data[0].ksName;
                                            }
                                            print("Ks Id");

                                            print(data[0].ksId);
                                            return data.isNotEmpty
                                                ? StationCard(
                                              fromList: false,
                                              onTap: () {
                                                // selectedIndex = 0;
                                                setState(() {});
                                              },
                                              name: data[0].ksName,
                                              id: data[0].ksId,
                                              location: data[0].ksLocation.address,
                                              distance: data[0].distance.toString(),
                                              currentIndex: 0,
                                              selectedIndex: 0,
                                            )
                                                : Container(
                                              width: 328.w,
                                              height: 80.h,
                                              decoration: BoxDecoration(
                                                  color: const Color(0xffD1D1D1),
                                                  border: Border.all(color: grey),
                                                  borderRadius:
                                                  BorderRadius.circular(10.r)),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 10.h,
                                                    bottom: 10.h,
                                                    left: 10.w,
                                                    right: 5.w),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/images/my_station.svg',
                                                      color: grey,
                                                      height: 30.h,
                                                    ),
                                                    21.horizontalSpace,
                                                    SizedBox(
                                                      width: 250.w,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          const Flexible(
                                                            child: Text(
                                                              'No Station Nearby',
                                                            ),
                                                          ),
                                                          1.verticalSpace,
                                                          Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                  'assets/images/location.svg',
                                                                  color: black),
                                                              7.horizontalSpace,
                                                              const Text(
                                                                'change range to find more',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black87),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          error: (e, st) => Text(e.toString()),
                                          loading: () => const CircularProgressIndicator());
                                    }),
                              );
                            })
                          ],
                        ),

                        15.verticalSpace,
                        const Text(
                          'Referral',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff563e1f)),
                        ),
                        10.verticalSpace,
                        AppTextField(
                          hintText: 'Enter Referral Code',
                          textController: _referralCodeController,
                          maxlines: 1,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(24),
                          ],
                        ),
                        30.verticalSpace,
                      ],
                    ),
                  ),
                ],
              ),
            ),
            10.verticalSpace,
            Center(
                child: SizedBox(
                  height: 48,
                  width: 320,
                  child: ElevatedButton(
                    // onPressed: () =>
                    //     {context.router.push(const SellerStatusRoute())},
                      onPressed: () {
                        if (_pickedImages[0] == null ||
                            _pickedImages[1] == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              getSnackBar("upload both images"));
                        } else {
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
                          _submit(context,
                              sellerVerificationModel:
                              SellerVerificationModel(
                                dcId: dcId,
                                  dcName: dcName,
                                  sellerType: selectedCategory,
                                  location: jsonEncode(_locationList),
                                  userId: UserPreferences.userId,
                                  fullName:
                                  _nameTextEditingController.text,
                                  email:
                                  _emailTextEditingController.text,
                                  businessDetails:
                                  _descriptionTextEditingController
                                      .text,
                                  referralCode: _referralCodeController.value.text.trim(),
                                  hasRegistered: true),
                              images: [
                                _pickedImages[0]!,
                                _pickedImages[1]!
                              ]);
                        }
                      },
                      child: const Text(
                        'Submit Verification',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      )),
                )),
          ],
        ),
      ),
    );
  }

  Future<void> _submit(BuildContext context,
      {required SellerVerificationModel    sellerVerificationModel,
      required List<File> images}) async {
    if (_formKey.currentState!.validate() && images.length == 2) {
      showLoading(context);
      try {
        print(sellerVerificationModel.referralCode);
        await ref.read(stationSellRepoProvider).sellerVerificationFormSubmit(
            sellerVerificationModel: sellerVerificationModel, images: images);
        context.router.pop();
        context.router.push(const SellerStatusRoute());
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
