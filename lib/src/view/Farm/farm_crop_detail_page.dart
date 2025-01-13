import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';

import '../../../global_providers.dart';
import '../../constants/colors.dart';
import '../../infrastructure/http/app_exception.dart';
// import '../../model/farm/crop_detail.dart';
import '../../model/farm/farm_entity.dart';

@RoutePage()
class FarmCropDetailPage extends StatelessWidget {
  const FarmCropDetailPage(this.crop);

  final CropDetail crop;

  void requestPendingSnackBar(BuildContext context) {
    final requestSnackBar = SnackBar(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      backgroundColor: const Color(0xffFFF3D7),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Hal Analysis in Progess",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: deepOrange,
              ),
            ),
            8.verticalSpace,
            Text(
              "Your next analysis report will be created after 7 days.",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: brown,
              ),
            ),
          ],
        ),
      ),
    );
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(requestSnackBar);
  }

  @override
  Widget build(BuildContext context) {
    final textstyle = TextStyle(
      fontSize: 14.sp,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 231,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/farm_raw.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: whitePrimary,
                      ),
                      onPressed: () => context.popRoute(),
                    ),
                    PopupMenuButton<int>(
                      elevation: 30,
                      position: PopupMenuPosition.under,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: whitePrimary,
                      icon: const Icon(
                        Icons.more_vert,
                        color: whitePrimary,
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 1,
                          height: 24,
                          onTap: () async {},
                          child: Text(
                            "Remove Crop",
                            style: textstyle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        crop.nameOfCrop,
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.amber,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/images/farm.svg"),
                          4.horizontalSpace,
                          Text(
                            "${crop.cropArea} ${crop.cropAreaUnit}",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  4.verticalSpace,
                  Text(
                    crop.cropDescription,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  30.verticalSpace,
                  Consumer(builder: (context, ref, child) {
                    return ElevatedButton(
                      onPressed: () async {
                        try {
                          await ref
                              .read(farmRepoProvider)
                              .requestCropReport(crop.id!, context);

                          requestPendingSnackBar(context);
                        } on AppException catch (e) {
                          e.whenOrNull(
                            connectivity: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("No Internet there")));
                            },
                            unauthorized: () {},
                            errorWithMessage: (message) {
                              debugPrint(message);
                              if (message ==
                                  "Please wait for the 7 days for the next request.") {
                                requestPendingSnackBar(context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(message)));
                              }
                            },
                            error: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Something went wrong")));
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.maxFinite, 54)),
                      child: const Text("Request Crop Analysis"),
                    );
                  }),
                  20.verticalSpace,
                  OutlinedButton(
                    onPressed: () {
                      context.router.push(CropReportRoute(crop: crop));
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.maxFinite, 54),
                    ),
                    child: const Text("Download Reports"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
