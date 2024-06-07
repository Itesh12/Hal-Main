import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/l10n/l10n.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';

import '../../../../global_providers.dart';
import '../../../constants/colors.dart';
import '../../../model/station/seller_dashboard_model.dart';
import 'name_widget.dart';

class SellerDetail extends ConsumerStatefulWidget {
  const SellerDetail({super.key});

  @override
  ConsumerState<SellerDetail> createState() => _ConsumerSellerDetailState();
}

class _ConsumerSellerDetailState extends ConsumerState<SellerDetail> {
  final List<String> _months = ['All', 'Today', 'Weekly', 'Monthly', 'Yearly'];
  String _selected = 'All';

  SellerDashboardModel? sellerDashboardModel;
  final remainingtextController = TextEditingController();
  @override
  void initState() {
    super.initState();

    _getData();
  }

  Future<void> _getData() async {
    final val = await ref.read(droneServiceRepoProvider).getSellerStatus();
    try {
      sellerDashboardModel = await ref
          .read(droneServiceRepoProvider)
          .getdashboardDetails(time: _selected, sellerId: val.id);
      setState(() {});
      print("debug coming");
    } on Exception {
      // TODO
    }
  }

  @override
  Widget build(BuildContext context) {
    final _myOrderlistController =
        ref.watch(sellerOrderListProvider(UserPreferences.userId));
    final listings = _myOrderlistController.orderList;
    return Container(
      // color: Colors.white,
      // height: 645,
      // width: 376,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Analytics",
                    style: TextStyle(
                        color: const Color(0xff563e1f),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                    // height: 29.h,
                    width: 85.w,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      border: Border.all(
                        color: const Color(0xffdfdfdf),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: DropdownButton(
                      underline: const SizedBox.shrink(),
                      borderRadius: BorderRadius.circular(8),
                      elevation: 12,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 18,
                        color: Color(0xffE26B26),
                      ),
                      // hint: Text(
                      //   'Monthly',
                      //   style: TextStyle(
                      //       color: const Color(0xff563e1f),
                      //       fontSize: 14.sp,
                      //       fontWeight: FontWeight.w400),
                      // ),
                      value: _selected,
                      onChanged: (newValue) async {
                        final val = await ref
                            .read(droneServiceRepoProvider)
                            .getSellerStatus();
                        _selected = newValue!;

                        try {
                          final obj = await ref
                              .read(droneServiceRepoProvider)
                              .getdashboardDetails(
                                  time: newValue, sellerId: val.id);
                          debugPrint(obj.toString());
                          sellerDashboardModel = obj;
                          setState(() {});
                          print("debug coming");
                        } on Exception catch (e) {
                          debugPrint(e.toString());
                        }
                        setState(() {});
                      },
                      items: _months.map((months) {
                        return DropdownMenuItem(
                          value: months,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              months,
                              style: TextStyle(
                                  color: const Color(0xff563e1f),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
            15.verticalSpace,
            Text(
              AppLocalizations.of(context)!.payments,
              style: TextStyle(
                  color: const Color(0xff4D4D4D),
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500),
            ),
            10.verticalSpace,
            SizedBox(
              width: 335.w,
              child: FittedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            // height: 86.h,
                            width: 162.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                14,
                              ),
                              color: const Color(0xffE26B26),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  // height: 20,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/money-tick.svg'),
                                      8.horizontalSpace,
                                      Text(
                                        AppLocalizations.of(context)!.received,
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xffFFFFFF)),
                                      ),
                                    ],
                                  ),
                                ),
                                7.verticalSpace,
                                SizedBox(
                                  // height: 25.h,
                                  child: Text(
                                    "₹${sellerDashboardModel?.TotalPaymentReceived ?? "0"}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffFFFFFF)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 10.horizontalSpace,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            // height: 86.h,
                            width: 162.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                14,
                              ),
                              color: const Color(0xffFFeacd),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  // height: 20,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/money-time.svg'),
                                      8.horizontalSpace,
                                      Text(
                                        AppLocalizations.of(context)!.pending,
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xffe26b26)),
                                      ),
                                    ],
                                  ),
                                ),
                                7.verticalSpace,
                                SizedBox(
                                  // height: 25.h,
                                  child: Text(
                                    "₹${sellerDashboardModel?.TotalRemainingPayment ?? "0"}",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xffe26b26)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            20.verticalSpace,
            Text(
              AppLocalizations.of(context)!.orders,
              style: TextStyle(
                  color: const Color(0xff4D4D4D),
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500),
            ),
            15.verticalSpace,
            Container(
              // height: 180.h,
              // width: 350.h,
              decoration: BoxDecoration(
                color: const Color(0xffff5f5f5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // height: 70.h,
                          width: 96.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextSeller(
                            color: const Color(0xff3a974c),
                            count: sellerDashboardModel?.TotalDelivered
                                    .toString() ??
                                "0",
                            countSize: 20,
                            fontWeight: FontWeight.w700,
                            size: 13,
                            text: AppLocalizations.of(context)!.delivered,
                          ),
                        ),
                        // const SizedBox(width: 8),
                        Container(
                          // height: 70.h,
                          width: 96.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextSeller(
                            color: const Color(0xfff39a00),
                            count:
                                sellerDashboardModel?.TotalPending.toString() ??
                                    "0",
                            fontWeight: FontWeight.w700,
                            size: 13,
                            countSize: 20,
                            text: AppLocalizations.of(context)!.pending,
                          ),
                        ),
                        // const SizedBox(width: 9),
                        Container(
                          // height: 70.h,
                          width: 96.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextSeller(
                            color: const Color(0xffe94b56),
                            count: sellerDashboardModel?.TotalCancelled
                                    .toString() ??
                                "0",
                            countSize: 20,
                            fontWeight: FontWeight.w700,
                            size: 13,
                            text: AppLocalizations.of(context)!.cancel,
                          ),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            // height: 70.h,
                            width: 198.w,
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 12.0, left: 14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 15,
                                    child: Text(
                                      "Area Covered",
                                      style: TextStyle(
                                          color: Color(0xff417ace),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  4.verticalSpace,
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Text(
                                          sellerDashboardModel?.TotalAreaCovered
                                                  .toString() ??
                                              "0",
                                          style: const TextStyle(
                                              color: Color(0xff417ace),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        4.horizontalSpace,
                                        Text(
                                          "acre",
                                          style: TextStyle(
                                              color: Color(0xff417ace),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )

                            // TextSeller(
                            //   color: Color(0xff417ace),
                            //   count:
                            //       '${sellerDashboardModel?.totalAreaCovered} acres',
                            //   countSize: 20,
                            //   fontWeight: FontWeight.w700,
                            //   size: 13,
                            //   text: 'Area Covered',
                            // ),
                            ),
                        Container(
                          // height: 70.h,
                          width: 96.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextSeller(
                            color: const Color(0xff777777),
                            count: sellerDashboardModel?.TotalListings
                                    .toString() ??
                                "0",
                            countSize: 20,
                            fontWeight: FontWeight.w700,
                            size: 13,
                            text: AppLocalizations.of(context)!.total_listings,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            20.verticalSpace,
            Text(
              '${AppLocalizations.of(context)!.pending} ${AppLocalizations.of(context)!.payments}',
              style: TextStyle(
                  color: const Color(0xff4D4D4D),
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500),
            ),
            15.verticalSpace,
            if (_myOrderlistController.orderList
                .where((element) => element.orderStatus == "Delivered")
                .isNotEmpty)
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (index == listings.length) {
                    if (_myOrderlistController.isLoadMoreRunning) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 40),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (_myOrderlistController.isLoadMoreError) {
                      return Container(
                        padding: const EdgeInsets.only(top: 30, bottom: 40),
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            _myOrderlistController.loadMoreErrorMessage,
                            style: const TextStyle(color: redError),
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  } else {
                    if (listings[index].orderStatus != "On the way" &&
                        listings[index].orderStatus != "Cancelled") {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OrderListCard(
                          sellerOrderlistModel: listings[index],
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  }
                },
                itemCount: listings.length,
              )
            else
              SizedBox(
                  // height: 150.h,
                  child: Card(
                    color: const Color(0xffffffff),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: const BorderSide(
                        color: Color(0xffcccccc),
                        width: 0.5,
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            2.verticalSpace,
                            SvgPicture.asset(
                              'assets/images/order_1.svg',
                              // height: 65.h,
                            ),
                            7.verticalSpace,
                            Text(AppLocalizations.of(context)!.dont_have_order,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: const Color(0xff737373),
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ),
                  )),

            30.verticalSpace,
            // Container(
            //   height: 126,
            //   // width: 350,
            //   decoration: BoxDecoration(
            //     color: const Color(0xfffdf3ee),
            //     borderRadius: BorderRadius.circular(13),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.all(12.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Row(
            //           children: [
            //             // const SizedBox(width: 3),
            //             Text(
            //               "Total Earnings:",
            //               style: TextStyle(
            //                   color: const Color(0xff563E1F),
            //                   fontSize: 14.sp,
            //                   fontWeight: FontWeight.w400),
            //             ),
            //             const SizedBox(width: 5),
            //             Text(
            //               "₹2,600.72",
            //               style: TextStyle(
            //                   color: const Color(0xffe26b26),
            //                   fontSize: 18.sp,
            //                   fontWeight: FontWeight.w700),
            //             )
            //           ],
            //         ),
            //         const SizedBox(
            //           height: 6,
            //         ),
            //         Container(
            //           height: 64,
            //           width: 313,
            //           decoration: BoxDecoration(
            //             color: const Color(0xffffffff),
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //           child: Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //               children: [
            //                 Row(
            //                   children: [
            //                     Text(
            //                       "Earnings in",
            //                       style: TextStyle(
            //                           color: const Color(0xff838383),
            //                           fontSize: 12.sp,
            //                           fontWeight: FontWeight.w400),
            //                     ),
            //                     const SizedBox(width: 1),
            //                     Text(
            //                       "Nov",
            //                       style: TextStyle(
            //                           color: const Color(0xff563e1f),
            //                           fontSize: 12.sp,
            //                           fontWeight: FontWeight.w600),
            //                     ),
            //                     const SizedBox(
            //                       width: 148,
            //                     ),
            //                     Text(
            //                       "Nov 2022",
            //                       style: TextStyle(
            //                           color: const Color(0xffE26B26),
            //                           fontSize: 12.sp,
            //                           fontWeight: FontWeight.w400),
            //                     ),
            //                     const Icon(
            //                       Icons.arrow_forward_ios,
            //                       size: 13,
            //                       color: Color(0xffE26B26),
            //                     )
            //                   ],
            //                 ),
            //                 Text(
            //                   "₹2,400.75",
            //                   style: TextStyle(
            //                       color: const Color(0xff563e1f),
            //                       fontSize: 16.sp,
            //                       fontWeight: FontWeight.w600),
            //                 )
            //               ],
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            // Container(
            //   height: 130,
            //   decoration: BoxDecoration(
            //     color: const Color(0xffffffff),
            //     borderRadius: BorderRadius.circular(1),
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Row(
            //         // crossAxisAlignment: CrossAxisAlignment.end,
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             "Analytics",
            //             style: TextStyle(
            //                 color: const Color(0xff563e1f),
            //                 fontSize: 17.sp,
            //                 fontWeight: FontWeight.w600),
            //           ),
            //           // const SizedBox(
            //           //   width: 205,
            //           // ),
            //           DropdownButton(
            //             underline: const SizedBox.shrink(),
            //             borderRadius: BorderRadius.circular(12),
            //             elevation: 12,
            //             icon: const Icon(
            //               Icons.keyboard_arrow_down,
            //               size: 21,
            //               color: Color(0xffE26B26),
            //             ),
            //             // hint: Text(
            //             //   'Monthly',
            //             //   style: TextStyle(
            //             //       color: const Color(0xff563e1f),
            //             //       fontSize: 14.sp,
            //             //       fontWeight: FontWeight.w400),
            //             // ),
            //             value: _selected,
            //             onChanged: (newValue) {
            //               setState(() {
            //                 _selected = newValue!;
            //               });
            //             },
            //             items: _months.map((months) {
            //               return DropdownMenuItem(
            //                 value: months,
            //                 child: Text(
            //                   months,
            //                   style: TextStyle(
            //                       color: const Color(0xff563e1f),
            //                       fontSize: 14.sp,
            //                       fontWeight: FontWeight.w400),
            //                 ),
            //               );
            //             }).toList(),
            //           ),
            //           // Text(
            //           //   "Monthly",
            //           //   style: TextStyle(
            //           //       color: const Color(0xff563e1f),
            //           //       fontSize: 14.sp,
            //           //       fontWeight: FontWeight.w400),
            //           // ),
            //           // const Icon(
            //           //   Icons.keyboard_arrow_down,
            //           //   size: 21,
            //           //   color: Color(0xffE26B26),
            //           // )
            //         ],
            //       ),
            //       const SizedBox(height: 10),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 20),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       "My Listing",
            //       style: TextStyle(
            //           color: const Color(0xff563e1f),
            //           fontSize: 17.sp,
            //           fontWeight: FontWeight.w600),
            //     ),
            //     // const SizedBox(width: 217),
            //     InkWell(
            //       onTap: () {
            //         // Navigator.pop(context, true);
            //         // context.router.push(const SellerserviceRoute());
            //       },
            //       child: SizedBox(
            //         child: Row(
            //           children: [
            //             Text(
            //               "See all",
            //               style: TextStyle(
            //                   color: const Color(0xff563e1f),
            //                   fontSize: 14.sp,
            //                   fontWeight: FontWeight.w500),
            //             ),
            //             const Icon(
            //               Icons.arrow_forward_ios,
            //               size: 16,
            //               color: Color(0xffE26B26),
            //             )
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 12),
            // // ignore: prefer_const_constructors
            // SellerCard(
            //   text: 'Drone Spraying',
            //   countText: "24 Responses",
            //   timeText: "2 Feb 2022  | 9:32 PM",
            //   countColor: const Color(0xffe26b26),
            //   timeFontWeight: FontWeight.w400,
            //   size: 14,
            //   fontWeight: FontWeight.w500,
            //   color: const Color(0xff341d10),
            //   countSize: 12,
            //   timeColor: Color(0xff848484),
            // ),

            // const SizedBox(height: 10),
            // const SellerCard(
            //   text: "Storage Services",
            //   countText: "4 Responses",
            //   timeText: "2 Feb 2022  | 9:32 PM",
            //   size: 14,
            //   fontWeight: FontWeight.w500,
            //   color: Color(0xff341d10),
            //   countSize: 12,
            //   countColor: Color(0xffe26b26),
            //   timeFontWeight: FontWeight.w400,
            //   timeColor: Color(0xff848484),
            // )
          ],
        ),
      ),
    );
  }
}
