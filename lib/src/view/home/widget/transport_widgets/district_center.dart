
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../global_providers.dart';
import '../../../../app/router/router.gr.dart';
import '../../../../constants/colors.dart';
import '../../../../controller/station/my_station_controller.dart';
import '../../../../l10n/l10n.dart';
import '../../../station/widgets/station_card.dart';

class DistrictCenter extends StatefulWidget {
  const DistrictCenter({
    super.key,
  });

  @override
  State<DistrictCenter> createState() => _DistrictCenterState();
}

class _DistrictCenterState extends State<DistrictCenter> {
  String? stationId;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              stationId = nearByStation.id;

              return StationCard(
                fromList: false,
                onTap: () {
                  selectedIndex = 0;
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
                        if (data.isNotEmpty) stationId = data[0].id;

                        return data.isNotEmpty
                            ? StationCard(
                          fromList: false,
                          onTap: () {
                            selectedIndex = 0;
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
    );
  }
}