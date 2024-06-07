import 'package:auto_route/auto_route.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';
import 'package:kisaan_station/src/view/widget/dialogs/loading_dialog.dart';
import 'package:kisaan_station/src/view/widget/textfield_widget.dart';

import '../../../../global_providers.dart';
import '../../../constants/colors.dart';
import '../../../infrastructure/http/app_exception.dart';
import '../../../model/station/station_sell_service_form_model.dart';
import '../../../util/image_picker/image_picker.dart';
import '../../../util/text_validation/text_validation.dart';
import '../../widget/dialogs/success_dialog.dart';
import '../../widget/imageViewScreen.dart';
import '../../widget/snackbar.dart';

@RoutePage()
class DroneSprayingServiceFormPage extends ConsumerStatefulWidget {
  const DroneSprayingServiceFormPage({Key? key}) : super(key: key);

  @override
  _DroneSprayingServiceFormPageState createState() =>
      _DroneSprayingServiceFormPageState();
}

class _DroneSprayingServiceFormPageState
    extends ConsumerState<DroneSprayingServiceFormPage> {
  final _formKey = GlobalKey<FormState>();

  int ttlNoOfDrones = 0;
  final List<File> _pickedImages = [];

  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _mobileNoTextEditingController =
      TextEditingController();
  final TextEditingController _descriptionTextEditingController =
      TextEditingController();

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

  Future<void> chooseMultiImage({required int imageCount}) async {
    final pickedFile = await ref
        .read(mediaProvider)
        .pickMultiImage(count: imageCount, context: context);

    if (pickedFile.isNotEmpty) {
      _pickedImages.addAll(pickedFile);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                Text(
                  'Personal Details',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                ),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Name',
                  textController: _nameTextEditingController,
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
                  hintText: 'Mobile No',
                  textController: _mobileNoTextEditingController,
                  validator: (value) => Validate.phone(value!),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                ),
                25.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {});
                          if (ttlNoOfDrones > 0) {
                            ttlNoOfDrones--;
                          }
                        },
                        child: SvgPicture.asset('assets/images/dec_count.svg')),
                    32.horizontalSpace,
                    Container(
                      height: 42.h,
                      width: 190.w,
                      decoration: BoxDecoration(
                          color: const Color(0xffF9F9F9),
                          border: Border.all(
                            color: const Color(0xffF4F4F4),
                          ),
                          borderRadius: BorderRadius.circular(38.r)),
                      child: Center(
                          child: Text(
                        ttlNoOfDrones.toString(),
                        style: TextStyle(
                            fontSize: 22.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600),
                      )),
                    ),
                    32.horizontalSpace,
                    InkWell(
                      onTap: () {
                        setState(() {});
                        ttlNoOfDrones++;
                      },
                      child: SvgPicture.asset(
                        'assets/images/inc_count.svg',
                      ),
                    ),
                  ],
                ),
                33.verticalSpace,
                Text(
                  'Description',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                ),
                12.verticalSpace,
                AppTextField(
                  maxlines: 4,
                  hintText: 'e.g, Brand Name, Tank Capacity',
                  textController: _descriptionTextEditingController,
                  validator: (value) =>
                      Validate.minLength(value: value!, minLen: 3),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(150),
                  ],
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Text(
                      'Pilot Liscense',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                5.verticalSpace,
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _pickedImages.length + 1,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return index == 0
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                5.verticalSpace,
                                InkWell(
                                  onTap: _pickedImages.length == 10
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
                                                  10 - _pickedImages.length;
                                              chooseMultiImage(
                                                  imageCount: length);
                                              setState(() {});
                                            }
                                          }
                                        },
                                  child: Container(
                                    height: 80.w,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(9.r)),
                                        border: Border.all(
                                            color: const Color(0xffE5E5E5))),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 50.h,
                                        color: grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                InkWell(
                                    onTap: () {
                                      _pickedImages.removeAt(index - 1);
                                      setState(() {});
                                    },
                                    child: SvgPicture.asset(
                                        'assets/images/remove_icon.svg')),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ImageViewScreen(
                                              image: _pickedImages[index - 1]),
                                        ));
                                  },
                                  child: Container(
                                    height: 80.w,
                                    width: 80.w,
                                    margin: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(9.r)),
                                        image: DecorationImage(
                                            image: FileImage(
                                                _pickedImages[index - 1]),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ],
                            );
                    }),
                15.verticalSpace,
                Center(
                    child: ElevatedButton(
                        onPressed: () {
                          if (_pickedImages.isEmpty || ttlNoOfDrones == 0) {
                            if (_pickedImages.isEmpty) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(getSnackBar("upload images"));
                            }
                            if (ttlNoOfDrones == 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  getSnackBar("add atleast one drone"));
                            }
                          } else {
                            _submit(context,
                                sellDroneServicesTextFieldModel:
                                    SellDroneServicesTextFieldModel(
                                        sellerUserId: UserPreferences.userId,
                                        name: _nameTextEditingController.text,
                                        mobileNo:
                                            _mobileNoTextEditingController.text,
                                        selectKs: 'Delhi',
                                        TotalDrones: ttlNoOfDrones),
                                images: _pickedImages);
                          }
                        },
                        child: const Text('Submit')))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submit(BuildContext context,
      {required SellDroneServicesTextFieldModel sellDroneServicesTextFieldModel,
      required List<File> images}) async {
    if (_formKey.currentState!.validate() && images.isNotEmpty) {
      showLoading(context);
      try {
        await ref.read(stationSellRepoProvider).droneSprayingServiceFormSubmit(
            sellDroneServicesTextFieldModel: sellDroneServicesTextFieldModel,
            images: images);

        successDialog(context, message: 'Successfully Submitted',
            onPressed: () {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);

          // Navigator.pop(context);
        });
        // context.router.pop();
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
