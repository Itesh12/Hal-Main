import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/l10n/l10n.dart';
import 'package:readmore/readmore.dart';

import '../../../../global_providers.dart';
import '../../../controller/station/my_station_controller.dart';
import '../widgets/station_card.dart';

@RoutePage()
class DroneSprayingPage extends ConsumerStatefulWidget {
  const DroneSprayingPage({Key? key}) : super(key: key);

  @override
  _DroneSprayingPageState createState() => _DroneSprayingPageState();
}

class _DroneSprayingPageState extends ConsumerState<DroneSprayingPage> {
  int selectedIndex = 0;
  String? stationId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
        // centerTitle: false,
        title: Text(
          'Drone Spraying',
          style: TextStyle(color: primary, fontSize: 20.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: pagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/drone_spraying.png',
                    height: 40.h,
                    width: 40.h,
                  ),
                  35.verticalSpace,
                  Row(
                    children: [
                      Text(
                        'Drone Spray',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Text(
                        'Rs 500',
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: primary,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        ' / acre',
                        style: TextStyle(fontSize: 14.sp, color: grey),
                      ),
                    ],
                  ),
                  35.verticalSpace,
                ],
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            Padding(
                padding: pagePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Information',
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                     ReadMoreText(
                      AppLocalizations.of(context)!.drone_spraying_text,
                      trimLength: 100,
                      trimCollapsedText: AppLocalizations.of(context)!.view_more,
                      trimExpandedText: '   ${AppLocalizations.of(context)!.see_less}',
                      style: const TextStyle(color: grey),
                      moreStyle: const TextStyle(color: primary),
                      lessStyle: const TextStyle(color: brown),
                    ),
                    30.verticalSpace,
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.district_center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
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
                                fontWeight: FontWeight.w300),
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
                                              // SizedBox(
                                              //   height: 99.h,
                                              //   width: 62.w,
                                              //   child: Column(
                                              //     children: [
                                              //       const Spacer(),
                                              //       Row(
                                              //         children: [
                                              //           SvgPicture.asset('assets/images/call.svg'),
                                              //           9.5.horizontalSpace,
                                              //           SvgPicture.asset('assets/images/direction.svg'),
                                              //         ],
                                              //       ),
                                              //     ],
                                              //   ),
                                              // )
                                            ],
                                          ),
                                        ),
                                      );
                              },
                              error: (e, st) => Text(e.toString()),
                              loading: () => const CircularProgressIndicator());
                        }),
                      );
                    }),
                    200.verticalSpace,
                    Row(
                      children: [
                         Expanded(
                            child: ElevatedButton(
                                onPressed: null, child: Text(AppLocalizations.of(context)!.cancel))),
                        12.horizontalSpace,
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  debugPrint(
                                      "stationId:${stationId.toString()}");
                                  context.router.push(
                                      RequestDroneSprayFormRoute(
                                          stationId: stationId!));
                                },
                                child:  Text(AppLocalizations.of(context)!.request_now))),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
