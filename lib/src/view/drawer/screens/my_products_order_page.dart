import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/view/widget/no_item_widget.dart';

import '../../../../global_providers.dart';
import '../../../app/router/router.gr.dart';
import '../../../model/station/drone_service_model.dart';

class MyOrderProductsPage extends StatefulWidget {
  const MyOrderProductsPage({Key? key}) : super(key: key);

  @override
  _MyOrderProductsPageState createState() => _MyOrderProductsPageState();
}

class _MyOrderProductsPageState extends State<MyOrderProductsPage> {
  final List<String> _choices = [
    'All',
    'Ongoing',
    'Completed',
    // 'Products',
    // 'Services'
  ];
  final int _choiceIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          25.verticalSpace,
          // SizedBox(
          //   height: 40.h,
          //   width: 340.w,
          //   child: ListView.separated(
          //     separatorBuilder: (context, index) => SizedBox(
          //       width: 4.w,
          //     ),
          //     scrollDirection: Axis.horizontal,
          //     shrinkWrap: true,
          //     itemCount: _choices.length,
          //     itemBuilder: (context, index) => ChoiceChip(
          //       side: BorderSide(
          //           width: 0.5,
          //           color:
          //               _choiceIndex == index ? const Color(0xff200E32) : grey),
          //       label: Text(_choices[index]),
          //       selected: _choiceIndex == index,
          //       selectedColor: const Color(0xffFFF3D7),
          //       onSelected: (bool selected) {
          //         setState(() {
          //           _choiceIndex = selected ? index : 0;
          //         });
          //       },
          //       backgroundColor: Colors.white,
          //       labelStyle: TextStyle(
          //           color: _choiceIndex == index ? Colors.black87 : grey,
          //           fontSize: 12.sp),
          //     ),
          //   ),
          // ),
          // 20.verticalSpace,
          Consumer(builder: (context, ref, child) {
            final res = ref.watch(droneServiceListProvider);
            return res.when(
              data: (data) {
                if (data.isNotEmpty) {
                  return ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) => MyOrderCard(
                            droneServiceModel: data[index],
                          ));
                } else {
                  return const NoItemWidget(
                    title: "No Services",
                    subTitle: "Explore some Kisaan Station Services",
                  );
                }
              },
              error: (error, stackTrace) {
                print(stackTrace);
                return Center(child: Text("$error"));
              },
              loading: () => const Center(child: CircularProgressIndicator()),
            );
          })
        ],
      ),
    );
  }
}

class MyOrderCard extends StatelessWidget {
  const MyOrderCard({Key? key, required this.droneServiceModel})
      : super(key: key);

  final DroneServiceModel droneServiceModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 165.h,
        width: 335.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black26.withOpacity(0.1),
              blurRadius: 2.0,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 6.h,
                  height: 6.h,
                  decoration: const BoxDecoration(
                      color: Color(0xFF18967D), shape: BoxShape.circle),
                ),
                12.horizontalSpace,
                Text(
                  'Booking ID: #${droneServiceModel.bookingId}',
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Text(
                  droneServiceModel.bookingDate,
                  style: TextStyle(color: grey, fontSize: 12.sp),
                ),
              ],
            ),
            const Divider(
              thickness: 1.2,
            ),
            Row(
              children: [
                Text('Service Name',
                    style: TextStyle(color: Colors.black87, fontSize: 12.sp)),
                const Spacer(),
                Text(droneServiceModel.serviceName,
                    style: TextStyle(color: grey, fontSize: 12.sp)),
              ],
            ),
            Row(
              children: [
                Text('Status',
                    style: TextStyle(color: Colors.black87, fontSize: 12.sp)),
                const Spacer(),
                Text(droneServiceModel.orderStatus,
                    style: TextStyle(color: green, fontSize: 12.sp)),
              ],
            ),
            15.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    width: 144.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                        color: const Color(0xffF1F1F1),
                        borderRadius: BorderRadius.all(Radius.circular(24.r))),
                    child: InkWell(
                        onTap: () {
                          context.router.push(BookingDetailsRoute(
                              droneServiceModel: droneServiceModel));
                        },
                        borderRadius: BorderRadius.all(Radius.circular(24.r)),
                        child: const Center(child: Text('View Details'))),
                  ),
                ),
                20.horizontalSpace,
                Expanded(
                  child: Container(
                    width: 144.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: primary),
                        borderRadius: BorderRadius.all(Radius.circular(24.r))),
                    child: InkWell(
                      onTap: () {
                        context.router.push(BookingStatusRoute(
                            droneServiceModel: droneServiceModel));
                      },
                      borderRadius: BorderRadius.all(Radius.circular(24.r)),
                      child: const Center(
                          child: Text(
                        'Track Order',
                        style: TextStyle(color: primary),
                      )),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
