
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/view/home/widget/SellerListing_pages.dart';

import '../../../../global_providers.dart';
import '../../../util/services/shared_preferences.dart';
import '../../widget/coming_soon.dart';
import '../../widget/no_item_widget.dart';
import 'name_widget.dart';

@RoutePage()
class SellerOrderPage extends ConsumerStatefulWidget {
  const SellerOrderPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SellerOrderPageState();
}

class _SellerOrderPageState extends ConsumerState<SellerOrderPage> {
  int currentIndex = 0;
  ScrollController bazaarScrollController = ScrollController();
  TextEditingController searchController = TextEditingController();

  final PageController _pageController = PageController();

  List<Widget> tabs() {
    final List<Widget> list = [
      Tab(
        icon: Container(
          height: 45,
          width: 180,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  topLeft: Radius.circular(30)),
              color: Color(0xffF0F0F0)),
          child: Container(
            height: 45,
            width: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: currentIndex == 0 ? primary : const Color(0xffF0F0F0)),
            child: Center(
              child: Text(
                "SERVICES",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    color: currentIndex == 0
                        ? Colors.white
                        : const Color(0xff636363),
                    fontWeight:
                        currentIndex == 0 ? FontWeight.w600 : FontWeight.w400,
                    fontFamily: 'Poppins'),
              ),
            ),
          ),
        ),
        iconMargin: EdgeInsets.only(left: 30.w),
        child: const SizedBox(),
      ),
      Tab(
          iconMargin: EdgeInsets.only(right: 30.w),
          icon: Container(
            height: 45,
            width: 190,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                color: Color(0xffF0F0F0)),
            child: Container(
              height: 45,
              width: 190,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: currentIndex == 1 ? primary : const Color(0xffF0F0F0)),
              child: Center(
                child: Text(
                  "PRODUCTS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12,
                      color: currentIndex == 1
                          ? Colors.white
                          : const Color(0xff636363),
                      fontWeight:
                          currentIndex == 1 ? FontWeight.w600 : FontWeight.w400,
                      fontFamily: 'Poppins'),
                ),
              ),
            ),
          ),
          child: const SizedBox()),
    ];
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs().length,
      child: NestedScrollView(
        controller: bazaarScrollController,
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              snap: true,
              floating: true,
              toolbarHeight: 0,
              expandedHeight: 20.h,
              forceElevated: innerBoxIsScrolled,
              bottom: TabBar(
                enableFeedback: true,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                labelPadding: EdgeInsets.zero,
                tabs: tabs(),
                onTap: (val) {
                  currentIndex = val;
                  ref.refresh(sellerOrderListProvider(userId));
                  setState(() {});
                },
                // indicatorSize: TabBarIndicatorSize.tab,
                // indicator: const UnderlineTabIndicator(
                //   borderSide: BorderSide(color: Colors.red, width: 0),
                // )
              ),
            ),
          ];
        },
        body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: SellerOrderDetails(),
              ),
              ComingSoon()
            ]),
      ),
    );
  }
}

class SellerOrderDetails extends ConsumerStatefulWidget {
  const SellerOrderDetails({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SellerOrderDetailsState();
}

class _SellerOrderDetailsState extends ConsumerState<SellerOrderDetails> {
  String userId = UserPreferences.userId;
  @override
  Widget build(BuildContext context) {
    final _myOrderlistController = ref.watch(sellerOrderListProvider(userId));
    final listings = _myOrderlistController.orderList;

    return _myOrderlistController.orderList.isEmpty
        ? const SizedBox(
            child: NoorderWidget(
              icon: "order_1",
              title: "No Orders Yet",
              subTitle: "You have not received any order yet.",
            ),
          )
        : _myOrderlistController.isFirstError
            ? Container(
                padding: const EdgeInsets.only(top: 30, bottom: 40),
                color: Colors.white,
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Text(
                          _myOrderlistController.firstErrorMessage,
                          style: const TextStyle(color: redError),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_myOrderlistController.firstErrorMessage !=
                              "Session Expired...") {
                            _myOrderlistController.refresh(context);
                          } else {}
                        },
                        child: Text(_myOrderlistController.firstErrorMessage ==
                                "Session Expired..."
                            ? "SignIn Again"
                            : "Retry"),
                      )
                    ],
                  ),
                ),
              )
            : listings.isNotEmpty
                ? SingleChildScrollView(
                    child: Padding(
                      padding: pagePadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ongoing Orders",
                            style: TextStyle(
                                color: const Color(0xff563e1f),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          13.verticalSpace,
                          if (_myOrderlistController.orderList
                              .where((element) =>
                                  element.orderStatus == "On the way")
                              .isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  if (index == listings.length) {
                                    if (_myOrderlistController
                                        .isLoadMoreRunning) {
                                      return const Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 40),
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    } else if (_myOrderlistController
                                        .isLoadMoreError) {
                                      return Container(
                                        padding: const EdgeInsets.only(
                                            top: 30, bottom: 40),
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            _myOrderlistController
                                                .loadMoreErrorMessage,
                                            style: const TextStyle(
                                                color: redError),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return const SizedBox();
                                    }
                                  } else {
                                    if (listings[index].orderStatus ==
                                        "On the way") {
                                      return OngoindOrderList(
                                        sellerOrderlistModel: listings[index],
                                      );
                                    } else {
                                      return const SizedBox();
                                    }
                                  }
                                },
                                itemCount: listings.length,
                              ),
                            )
                          else
                            SizedBox(
                                height: 150.h,
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
                                            height: 65.h,
                                          ),
                                          7.verticalSpace,
                                          Text(
                                              "You don’t have any Ongoing orders.",
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  color:
                                                      const Color(0xff737373),
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                          30.verticalSpace,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("History",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff563e1f),
                                      fontWeight: FontWeight.w600)),
                              InkWell(
                                onTap: () {},
                                child: SizedBox(
                                  height: 20,
                                  width: 60,
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/filter.svg',
                                        // height: 17,
                                      ),
                                      10.horizontalSpace,
                                      const Text("Filter",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xffe26b26),
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          13.verticalSpace,
                          if (_myOrderlistController.orderList
                              .where((element) =>
                                  element.orderStatus != "On the way")
                              .isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  if (index == listings.length) {
                                    if (_myOrderlistController
                                        .isLoadMoreRunning) {
                                      return const Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 40),
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    } else if (_myOrderlistController
                                        .isLoadMoreError) {
                                      return Container(
                                        padding: const EdgeInsets.only(
                                            top: 30, bottom: 40),
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            _myOrderlistController
                                                .loadMoreErrorMessage,
                                            style: const TextStyle(
                                                color: redError),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return const SizedBox();
                                    }
                                  } else {
                                    if (listings[index].orderStatus !=
                                        "On the way") {
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
                              ),
                            )
                          else
                            SizedBox(
                                height: 150.h,
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
                                            height: 65.h,
                                          ),
                                          7.verticalSpace,
                                          Text(
                                              "You don’t completed any orders.",
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  color:
                                                      const Color(0xff737373),
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                        ],
                      ),
                    ),
                  )
                : const SizedBox(
                    height: 400,
                    child: NoorderWidget(
                      icon: "task-1",
                      title: "No Orders Yet",
                      subTitle: "You have not received any order yet.",
                    ),
                  );
  }
  //   return Scaffold(
  //     backgroundColor: const Color(0xfff9f9f9),
  //     body: SingleChildScrollView(
  //       child: Padding(
  //         padding: pagePadding,
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               "Ongoing Orders",
  //               style: TextStyle(
  //                   color: const Color(0xff563e1f),
  //                   fontSize: 16.sp,
  //                   fontWeight: FontWeight.w600),
  //             ),
  //             10.verticalSpace,
  // InkWell(
  //   onTap: () {
  //     context.router.push(const SellerSingleOrderDetails());
  //   },
  //   child: Card(
  //     // elevation: ,
  //     shape: RoundedRectangleBorder(
  //       // side: BorderSide(color: Color(0xfff0f0f0), width: 2.w),
  //       borderRadius: BorderRadius.circular(15.0),
  //     ),
  //     child: SizedBox(
  //       height: 150,
  //       child: Column(
  //         children: [
  //           SizedBox(
  //             height: 72,
  //             child: Padding(
  //               padding: const EdgeInsets.all(10.0),
  //               child: Row(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   SizedBox(
  //                     height: 70,
  //                     width: 60,
  //                     child: IconButton(
  //                       onPressed: () {
  //                         context.router.push(const ProfileRoute());
  //                       },
  //                       icon: ProfilePicWidget(
  //                         url: UserPreferences.profilePic,
  //                         size: 70.h,
  //                         fizedSize: true,
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: 55,
  //                     width: 120,
  //                     child: Column(
  //                       crossAxisAlignment:
  //                           CrossAxisAlignment.start,
  //                       children: [
  //                         Text(
  //                           UserPreferences.userName,
  //                           textAlign: TextAlign.start,
  //                           style: TextStyle(
  //                               color: const Color(0xff341d10),
  //                               fontSize: 16.sp,
  //                               fontWeight: FontWeight.w600),
  //                         ),
  //                         Text(
  //                           "#263451",
  //                           style: TextStyle(
  //                               color: const Color(0xff848484),
  //                               fontSize: 14.sp,
  //                               fontWeight: FontWeight.w400),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   60.horizontalSpace,
  //                   SizedBox(
  //                     height: 50,
  //                     width: 80,
  //                     child: Padding(
  //                       padding: const EdgeInsets.only(right: 12.0),
  //                       child: Column(
  //                         children: [
  //                           25.verticalSpace,
  //                           Text(
  //                             "₹2,600",
  //                             style: TextStyle(
  //                                 color: const Color(0xffe26b26),
  //                                 fontSize: 14.sp,
  //                                 fontWeight: FontWeight.w700),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           const Divider(
  //             color: Color(0xffdedede),
  //             thickness: 1,
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(left: 20.0),
  //             child: Row(
  //               children: [
  //                 SvgPicture.asset(
  //                   'assets/images/drone_final.svg',
  //                   height: 8,
  //                 ),
  //                 10.horizontalSpace,
  //                 Text(
  //                   "Drone Spraying",
  //                   style: TextStyle(
  //                       color: const Color(0xff563e1f),
  //                       fontSize: 12.sp,
  //                       fontWeight: FontWeight.w400),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           7.verticalSpace,
  //           Padding(
  //             padding: const EdgeInsets.only(left: 20.0),
  //             child: Row(
  //               children: [
  //                 SvgPicture.asset(
  //                   'assets/images/location1.svg',
  //                   height: 17,
  //                 ),
  //                 10.horizontalSpace,
  //                 Text(
  //                   "Laalganj KS, Mirzapur - 192764",
  //                   style: TextStyle(
  //                       color: const Color(0xff563e1f),
  //                       fontSize: 12.sp,
  //                       fontWeight: FontWeight.w400),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           // const Divider(
  //           //   color: Color(0xffdedede),
  //           //   thickness: 1,
  //           // ),
  //           // Padding(
  //           //   padding: const EdgeInsets.only(right: 20, top: 5),
  //           //   child: Row(
  //           //     mainAxisAlignment: MainAxisAlignment.end,
  //           //     // crossAxisAlignment: CrossAxisAlignment.star,
  //           //     children: [
  //           //       InkWell(
  //           //         onTap: () {
  //           //
  //           //         },
  //           //         child: const SizedBox(
  //           //             height: 20,
  //           //             width: 100,
  //           //             child: Text('View Details',
  //           //                 style: TextStyle(
  //           //                     fontSize: 12,
  //           //                     color: Color(0xffe26b26),
  //           //                     fontWeight: FontWeight.w600))),
  //           //       ),
  //           //       // 10.horizontalSpace,
  //           //       SizedBox(
  //           //         height: 37,
  //           //         width: 160,
  //           //         child: ElevatedButton(
  //           //             style: ElevatedButton.styleFrom(
  //           //               backgroundColor: const Color(0xffe26b26),
  //           //               shape: RoundedRectangleBorder(
  //           //                 borderRadius: BorderRadius.circular(16.0),
  //           //               ),
  //           //               // background
  //           //             ),
  //           //             onPressed: () {},
  //           //             child: const Text('Accept Order',
  //           //                 style: TextStyle(
  //           //                     fontSize: 12,
  //           //                     color: Colors.white,
  //           //                     fontWeight: FontWeight.w500))),
  //           //       ),
  //           //     ],
  //           //   ),
  //           // ),
  //         ],
  //       ),
  //     ),
  //   ),
  // ),
  //             30.verticalSpace,

  //             10.verticalSpace,
  //             Container(
  //               height: 95,
  //               decoration: BoxDecoration(
  //                 color: const Color(0xffffffff),
  //                 // border: Border.all(
  //                 //   color: const Color(0xffcccccc),
  //                 //   width: 0.5,
  //                 // ),
  //                 borderRadius: BorderRadius.circular(12),
  //               ),
  //               child: Padding(
  //                 padding: const EdgeInsets.all(12.0),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Row(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         SizedBox(
  //                           height: 28,
  //                           width: 100,
  //                           child: Row(
  //                             children: [
  //                               SvgPicture.asset(
  //                                 'assets/images/tick-circle.svg',
  //                                 // height: 17,
  //                               ),
  //                               10.horizontalSpace,
  //                               Text("ID: 756432",
  //                                   style: TextStyle(
  //                                       fontSize: 14.sp,
  //                                       color: const Color(0xff563e1f),
  //                                       fontWeight: FontWeight.w600))
  //                             ],
  //                           ),
  //                         ),
  //                         Text("02 Nov 2022",
  //                             style: TextStyle(
  //                                 fontSize: 12.sp,
  //                                 color: const Color(0xff686868),
  //                                 fontWeight: FontWeight.w400))
  //                       ],
  //                     ),
  //                     Text("Laalganj KS, Mirzapur, Uttar Pardesh - 192764",
  //                         style: TextStyle(
  //                             fontSize: 12.sp,
  //                             color: const Color(0xff656565),
  //                             fontWeight: FontWeight.w400)),
  //                     Text("Amount: ₹2,600  |  Completed",
  //                         style: TextStyle(
  //                             fontSize: 12.sp,
  //                             color: const Color(0xff656565),
  //                             fontWeight: FontWeight.w600))
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             10.verticalSpace,
  //             Container(
  //               height: 95,
  //               decoration: BoxDecoration(
  //                 color: const Color(0xffffffff),
  //                 // border: Border.all(
  //                 //   color: const Color(0xffcccccc),
  //                 //   width: 0.5,
  //                 // ),
  //                 borderRadius: BorderRadius.circular(12),
  //               ),
  //               child: Padding(
  //                 padding: const EdgeInsets.all(12.0),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Row(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         SizedBox(
  //                           height: 28,
  //                           width: 100,
  //                           child: Row(
  //                             children: [
  //                               SvgPicture.asset(
  //                                 'assets/images/close-circle.svg',
  //                                 // height: 17,
  //                               ),
  //                               10.horizontalSpace,
  //                               Text("ID: 756432",
  //                                   style: TextStyle(
  //                                       fontSize: 14.sp,
  //                                       color: const Color(0xff563e1f),
  //                                       fontWeight: FontWeight.w600))
  //                             ],
  //                           ),
  //                         ),
  //                         Text("02 Nov 2022",
  //                             style: TextStyle(
  //                                 fontSize: 12.sp,
  //                                 color: const Color(0xff686868),
  //                                 fontWeight: FontWeight.w400))
  //                       ],
  //                     ),
  //                     Text("Laalganj KS, Mirzapur, Uttar Pardesh - 192764",
  //                         style: TextStyle(
  //                             fontSize: 12.sp,
  //                             color: const Color(0xff656565),
  //                             fontWeight: FontWeight.w400)),
  //                     Text("Amount: ₹2,600  |  Completed",
  //                         style: TextStyle(
  //                             fontSize: 12.sp,
  //                             color: const Color(0xff656565),
  //                             fontWeight: FontWeight.w600))
  //                   ],
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
