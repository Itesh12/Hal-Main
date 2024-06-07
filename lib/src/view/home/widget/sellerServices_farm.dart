import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/l10n/l10n.dart';
import 'package:kisaan_station/src/util/custom_drop_down_button.dart';
import 'package:kisaan_station/src/util/custom_image_grid.dart';
import 'package:kisaan_station/src/view/widget/snackbar.dart';
import 'package:kisaan_station/src/view/widget/textfield_widget.dart';

import '../../../../global_providers.dart';
import '../../../app/router/router.gr.dart';
import '../../../controller/seller/selected_kisaan_station_controller.dart';
import '../../../infrastructure/http/app_exception.dart';
import '../../../model/station/near_by_station_list_model.dart';
import '../../../model/station/seller_service_upload_model.dart';
import '../../../util/image_picker/image_picker.dart';
import '../../../util/services/shared_preferences.dart';
import '../../../util/text_validation/text_validation.dart';
import '../../widget/dialogs/loading_dialog.dart';
import '../../widget/imageViewScreen.dart';

@RoutePage()
class UploadDroneSprayFormPage extends ConsumerStatefulWidget {
  const UploadDroneSprayFormPage({
    Key? key,
    // required this.stationId,
  }) : super(key: key);
  // final String stationId;

  @override
  _UploadDroneSprayFormPageState createState() =>
      _UploadDroneSprayFormPageState();
}

class _UploadDroneSprayFormPageState
    extends ConsumerState<UploadDroneSprayFormPage> {
  final _formKey = GlobalKey<FormState>();

  final List<File> _pickedImages = [];
  final List<String> kisaanStation = [];
  List<NearByStaionListModel> nearStation = [];

  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _mobileNoTextEditingController =
      TextEditingController();
  final TextEditingController _descriptionTextEditingController =
      TextEditingController();
  final TextEditingController _kisanStationController = TextEditingController();

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

  Future<void> chooseMultiImage(
      {required int imageCount, required int index}) async {
    final pickedFile = await ref
        .read(mediaProvider)
        .pickMultiImage(count: imageCount, context: context);

    if (pickedFile.isNotEmpty) {
      _pickedImages.addAll(pickedFile);
      setState(() {});
    }
  }

  @override
  void dispose() {
    _nameTextEditingController.dispose();
    _descriptionTextEditingController.dispose();
    _kisanStationController.dispose();
    _mobileNoTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
        centerTitle: true,
        title: Text(
          "Drone Spraying",
          style: TextStyle(
            fontSize: 20.sp,
            color: primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: pagePadding,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   'Personal Details',
                //   style:
                //       TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                // ),
                // 10.verticalSpace,
                // SizedBox(
                //   height: 42,
                //   child: AppTextField(
                //     hintText: 'Name',
                //     textController: _nameTextEditingController,
                //     maxlines: 1,
                //     textCapitalization: TextCapitalization.words,
                //     validator: (value) =>
                //         Validate.minLength(value: value!, minLen: 3),
                //     inputFormatters: [
                //       LengthLimitingTextInputFormatter(24),
                //     ],
                //   ),
                // ),
                // 12.verticalSpace,
                // SizedBox(
                //   height: 42,
                //   child: AppTextField(
                //     hintText: 'Mobile No',
                //     maxlines: 1,
                //     textController: _mobileNoTextEditingController,
                //     validator: (value) => Validate.phone(value!),
                //     keyboardType: TextInputType.phone,
                //     inputFormatters: [
                //       LengthLimitingTextInputFormatter(10),
                //     ],
                //   ),
                // ),
                14.verticalSpace,
                 Text(AppLocalizations.of(context)!.select_district_center,
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                12.verticalSpace,
                SizedBox(
                  height: 50.h,
                  child: Consumer(builder: (context, ref, child) {
                    final nearStation = ref.watch(stationsProvider);
                    final val = nearStation.map((e) => e.ksId).toString();
                    _kisanStationController.text =
                        val.substring(1, val.length - 1);
                    return AppTextField(
                      onTap: () {
                        context.router
                            .push(const SellerselectKisaanStationListRoute())
                            .then((value) {
                          // if (value != null) {
                          //   _kisanStationController.text =
                          //       value.toString();
                          // }
                        });
                      },
                      hintText: AppLocalizations.of(context)!.enter_location,
                      readOnly: true,
                      suffixIcon: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Color(0xff585858),
                        ),
                      ),
                      textController: _kisanStationController,
                      keyboardType: TextInputType.streetAddress,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(40),
                      ],
                    );
                  }),
                ),
                14.verticalSpace,
                 Text(AppLocalizations.of(context)!.drone_no,
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                12.verticalSpace,

                SizedBox(
                  height: 50.h,
                  child: AppTextField(
                    hintText: AppLocalizations.of(context)!.drone_no_text,
                    textController: _mobileNoTextEditingController,
                    keyboardType: TextInputType.streetAddress,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(35),
                    ],
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     InkWell(
                //         onTap: () {
                //           setState(() {});
                //           if (ttlNoOfDrones > 0) {
                //             ttlNoOfDrones--;
                //           }
                //         },
                //         child: SvgPicture.asset('assets/images/dec_count.svg')),
                //     32.horizontalSpace,
                //     Container(
                //       height: 42.h,
                //       width: 190.w,
                //       decoration: BoxDecoration(
                //           color: const Color(0xffF9F9F9),
                //           border: Border.all(
                //             color: const Color(0xffF4F4F4),
                //           ),
                //           borderRadius: BorderRadius.circular(38.r)),
                //       child: Center(
                //           child: Text(
                //         ttlNoOfDrones.toString(),
                //         style: TextStyle(
                //             fontSize: 22.sp,
                //             color: Colors.black87,
                //             fontWeight: FontWeight.w600),
                //       )),
                //     ),
                //     32.horizontalSpace,
                //     InkWell(
                //       onTap: () {
                //         setState(() {});
                //         ttlNoOfDrones++;
                //       },
                //       child: SvgPicture.asset(
                //         'assets/images/inc_count.svg',
                //       ),
                //     ),
                //   ],
                // ),
                20.verticalSpace,
                 Text(AppLocalizations.of(context)!.drone_images,
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                12.verticalSpace,
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        _pickedImages.length > 2 ? 3 : _pickedImages.length + 1,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      final idx = _pickedImages.length == 3 ? index : index - 1;
                      return index == 0 && _pickedImages.length < 3
                          ? InkWell(
                              onTap: _pickedImages.length == 3
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
                                              imageCount: 3, index: idx);
                                        }
                                      }
                                    },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, bottom: 20.0),
                                child: Container(
                                  height: 65.w,
                                  width: 65.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(9.r)),
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
                                              image:
                                                  FileImage(_pickedImages[idx]),
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
                14.verticalSpace,
                 Text(AppLocalizations.of(context)!.description,
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                12.verticalSpace,
                SizedBox(
                  height: 82.h,
                  child: AppTextField(
                    maxlines: 5,
                    hintText: AppLocalizations.of(context)!.seller_description_text,
                    textController: _descriptionTextEditingController,
                    validator: (value) =>
                        Validate.minLength(value: value!, minLen: 3),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(150),
                    ],
                  ),
                ),
                90.verticalSpace,
                Divider(
                  color: const Color(0xff979797).withOpacity(0.4),
                ),
                10.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 48,
                      width: 140,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xffeeeeee),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26.0),
                          ), // background
                        ),
                        onPressed: () {
                          context.popRoute();
                        },
                        child:  Text(AppLocalizations.of(context)!.cancel,
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff9a9a9a),
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    SizedBox(
                      height: 48,
                      width: 177,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffe26b26),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26.0),
                            ),
                            // background
                          ),
                          onPressed: () async {
                            if (_pickedImages.isEmpty) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(getSnackBar("upload images"));
                            } else {
                              final val = await ref
                                  .read(droneServiceRepoProvider)
                                  .getSellerStatus();
                              final nearStation = ref.read(stationsProvider);
                              await _submit(context,
                                  sellerServiceUploadModel:
                                      SellerServiceUploadModel(
                                          sellerId: val.id,
                                          kisaanStations: nearStation
                                              .map((e) => e.id)
                                              .toList(),
                                          droneRegNo:
                                              _mobileNoTextEditingController
                                                  .text,
                                          description:
                                              _descriptionTextEditingController
                                                  .text),
                                  images: _pickedImages);
                              ref.refresh(sellerListingRepoProvider);
                              final _myListingController = ref.watch(
                                  sellerListingProvider(
                                      UserPreferences.userId));
                              _myListingController.refresh(context);
                              context.replaceRoute(const SellerSubmitRoute());
                            }
                          },
                          child:  Text(AppLocalizations.of(context)!.upload_service,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500))),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submit(BuildContext context,
      {required List<File> images,
      required SellerServiceUploadModel sellerServiceUploadModel}) async {
    if (_formKey.currentState!.validate() && images.isNotEmpty) {
      showLoading(context);
      try {
        await ref.read(stationSellRepoProvider).sellerServiceUploadFormSubmit(
            images: images, sellerServiceUploadModel: sellerServiceUploadModel);

        context.router.pop();
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
