import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/util/bottomsheet/bottom_sheet.dart';

final mediaProvider = Provider((ref) => MediaPicker());

class MediaPicker {
  // Future<File?> captureMedia({
  //   PickType pickType = PickType.image,
  //   double quality = 1,
  //   CropAspectRatio? aspectRatio = CropAspectRatio.custom,
  // }) async {
  //   final medias = await ImagesPicker.openCamera(
  //     pickType: pickType,
  //     quality: quality,
  //     maxTime: 1800,
  //     cropOpt: CropOption(aspectRatio: aspectRatio),
  //   );
  //   if (medias != null) {
  //     return File(medias[0].path);
  //   }
  //   return null;
  // }

  Future<File?> captureMedia({
    ImageSource source = ImageSource.camera,
  }) async {
    final XFile? medias = await ImagePicker().pickImage(
      source: source,
      preferredCameraDevice: CameraDevice.front,
      imageQuality: 50
    );
    if (medias != null) {
      return File(medias.path);
    }
    return null;
  }

  Future<File?> captureVideo({
    ImageSource source = ImageSource.camera,
  }) async {
    final XFile? medias = await ImagePicker().pickVideo(
      source: source,
      preferredCameraDevice: CameraDevice.front,
    );
    if (medias != null) {
      return File(medias.path);
    }
    return null;
  }

  Future<File?> pickVideo() async {
    final XFile? video = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );
    if (video != null) {
      return File(video.path);
    }
    return null;
  }

  Future<File?> pickImage({
    int quality = 1,
  }) async {
    final data = await ImagePicker().pickImage(
      source: ImageSource.gallery,
        imageQuality: 50
    );
    if (data != null) {
      return File(data.path);
    }
    return null;
  }

  Future<List<File>> pickMultiImage(
      {double quality = 1,
      int count = 10,
      required BuildContext context}) async {
    final List<File> images = [];

    final data = await ImagePicker().pickMultiImage(imageQuality: 50);

    if (data.length > count) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: primary,
          content: Center(child: Text("Cannot pick more than $count images"))));
      return [];
    }

    for (final image in data) {
      images.add(File(image.path));
    }

    return images;
  }

  Future<bool?> chooseSource(BuildContext context) async {
    bool? isCamera;

    isCamera = await buildShowModalBottomSheet<bool>(
      context,
      (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            27.verticalSpace,
            Text(
              'Upload from',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            18.verticalSpace,
            Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pop(context, true);
                  },
                  borderRadius: BorderRadius.circular(11),
                  child: Container(
                    width: 217.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[400]!),
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset("assets/images/camerapost.svg"),
                        13.horizontalSpace,
                        Text('Camera', style: TextStyle(fontSize: 12.sp)),
                      ],
                    ),
                  ),
                ),
                9.verticalSpace,
                InkWell(
                  onTap: () {
                    Navigator.pop(context, false);
                  },
                  borderRadius: BorderRadius.circular(11),
                  child: Container(
                    width: 217.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[400]!),
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset("assets/images/gallery.svg"),
                        14.horizontalSpace,
                        Text('Gallery', style: TextStyle(fontSize: 12.sp)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
      initialHeight: 0.24,
    );
    return isCamera;
  }

  Future<bool?> chooseSourceSeller(BuildContext context) async {
    bool? isCamera;

    isCamera = await buildShowModalBottomSheet<bool>(context, (controller) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          27.verticalSpace,
          Text(
            'Upload from',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          18.verticalSpace,
          Column(
            children: <Widget>[
              InkWell(
                onTap: () async {
                  context.popRoute(true);
                },
                borderRadius: BorderRadius.circular(11),
                child: Container(
                  width: 217.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[400]!),
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset("assets/images/camerapost.svg"),
                      13.horizontalSpace,
                      Text('Camera', style: TextStyle(fontSize: 12.sp)),
                    ],
                  ),
                ),
              ),
              9.verticalSpace,
              InkWell(
                onTap: () {
                  context.popRoute(false);
                },
                borderRadius: BorderRadius.circular(11),
                child: Container(
                  width: 217.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[400]!),
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset("assets/images/gallery.svg"),
                      14.horizontalSpace,
                      Text('Gallery', style: TextStyle(fontSize: 12.sp)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }, initialHeight: 0.24, useRootNavigator: false);
    return isCamera;
  }
}
