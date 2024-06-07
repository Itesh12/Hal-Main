import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/constants/colors.dart';

import '../../../../global_providers.dart';
import '../../../model/farm/farm_entity.dart';

class FarmTile extends ConsumerWidget {
  const FarmTile(
      {required this.farm,
      this.selectedColor = false,
      this.onTapDisabled = true});

  final FarmEntity farm;
  final bool selectedColor;
  final bool onTapDisabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        top: 12,
        bottom: 12,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          if(!selectedColor)
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 5,
                // spreadRadius: 2
            )
        ],
        color:
            selectedColor ? const Color(0xffFFF8e8) : const Color(0xffF9F9F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onTapDisabled ?  () {
              context.router.push(FarmRoute(farm: farm));
            } :null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            farm.farmDetails.farmName,
                            style: TextStyle(
                              fontSize: 17.sp,
                              color: primary,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/images/location.svg"),
                          4.horizontalSpace,
                          Expanded(
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              farm.farmDetails.address,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/images/farm.svg"),
                          4.horizontalSpace,
                          Text(
                            "${farm.farmDetails.farmArea} ${farm.farmDetails.farmAreaUnit}",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              ref.read(currentCoordinateProvider.notifier).state =
                  farm.farmDetails.location.coordinates;
              context
                  .pushRoute(FarmMapViewRoute(farmDetails: farm.farmDetails));
            },
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return CropTile(
                  crop: farm.cropDetails[index],
                  userId: farm.userId,
                  isNavigate: onTapDisabled,
                );
              },
              itemCount: farm.cropDetails.length,
            ),
          ),
        ],
      ),
    );
  }
}

class CropTile extends ConsumerWidget {
  const CropTile(
      {required this.crop, required this.userId, this.isNavigate = true});

  final CropDetail crop;
  final String userId;
  final bool isNavigate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final period =
        DateTime.now().toUtc().difference(crop.sowingDate!.toUtc()).inDays;
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: whitePrimary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            height: 65.w,
            width: 65.w,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/images/farm_raw.png"),
                fit: BoxFit.cover,
              ),
              color: whitePrimary,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      crop.nameOfCrop,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.amber,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          size: 14,
                          color: brown,
                        ),
                        2.horizontalSpace,
                        if (period > 0)
                          if (period == 1)
                            Text("$period Day")
                          else
                            Text("$period Days"),
                      ],
                    )
                  ],
                ),
                6.verticalSpace,
                Text(
                  "Area: ${crop.cropArea} ${crop.cropAreaUnit}",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
