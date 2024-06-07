import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/util/text_validation/text_format.dart';

import '../../../../global_providers.dart';
import '../../../constants/colors.dart';
import '../farm_page.dart';

class FarmDetailsWidget extends ConsumerWidget {
  const FarmDetailsWidget({
    super.key,
    required this.widget,
  });

  final FarmPage widget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.verticalSpace,
        Text(
          'Farm Details',
          style: TextStyle(
              color: primary, fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        5.verticalSpace,
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 3,
                    spreadRadius: 2)
              ]),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 90.w,
                      child: Text(
                        'Farm Name',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      )),
                  Expanded(
                      child: Text(":  ${widget.farm.farmDetails.farmName}")),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 90.w,
                      child: Text(
                        'Farm Id',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      )),
                  Expanded(
                      child: Text(":  ${widget.farm.id}")),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 90.w,
                      child: Text(
                        'Farm Status',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      )),
                  Expanded(
                      child: Text(
                          ":  ${widget.farm.farmDetails.farmStatus.toTitleCase()}")),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 90.w,
                      child: Text(
                        'Irrigation',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      )),
                  Expanded(
                      child: Text(
                          ":  ${widget.farm.farmDetails.irrigation.status.toTitleCase()}")),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 90.w,
                      child: Text(
                        'Farm Area',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      )),
                  Expanded(
                      child: Text(
                          ":  ${widget.farm.farmDetails.farmArea} ${widget.farm.farmDetails.farmAreaUnit}")),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 90.w,
                      child: Text(
                        'Address',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      )),
                  Expanded(
                      child: Text(":  ${widget.farm.farmDetails.address}")),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 90.w,
                      child: Text(
                        'State',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      )),
                  Expanded(child: Text(":  ${widget.farm.farmDetails.state}")),
                ],
              ),
              10.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                      height: 30.h,
                      child: ElevatedButton(
                          onPressed: () {
                            ref.read(currentCoordinateProvider.notifier).state =
                                widget.farm.farmDetails.location.coordinates;

                            context.pushRoute(FarmMapViewRoute(
                                farmDetails: widget.farm.farmDetails));
                          },
                          child: const Text('Map View'))),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
