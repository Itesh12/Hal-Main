import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';
import 'package:kisaan_station/src/view/home/widget/SellerListing_pages.dart';

import '../../../../global_providers.dart';
import '../../../constants/colors.dart';
import '../../../l10n/l10n.dart';
import '../../../model/station/seller_mylisting_model.dart';
import '../../../model/station/seller_orderlist_model.dart';
import '../../../util/utlis.dart';
import '../../social/post/widgets/search_bar.dart';
import '../../widget/profile_image.dart';

class NameWidget extends StatelessWidget {
  const NameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 160.h,
      child: Stack(
        // alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 121.h,
            width: double.maxFinite,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: deepOrange,
              image: const DecorationImage(
                alignment: Alignment.bottomCenter,
                image: AssetImage(
                  "assets/images/crop.png",
                ),
                fit: BoxFit.fitWidth,
              ),
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(15.r)),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, bottom: 24.h),
              child: Consumer(builder: (context, ref, child) {
                final res = ref.watch(userController(UserPreferences.userId));
                return res.when(
                  data: (user) {
                    return RichText(
                      text: TextSpan(
                        text: AppLocalizations.of(context)!.welcome,
                        style: textTheme.bodyLarge!.copyWith(
                          color: white,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: " ${user.name},",
                            style: textTheme.bodyLarge!.copyWith(
                                color: white,
                                fontWeight: FontWeight.w700,
                                fontSize: 24.sp),
                          ),
                        ],
                      ),
                    );
                  },
                  error: (_, __) => const SizedBox(),
                  loading: () => const SizedBox(),
                );
              }),
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: 20.w,
            right: 20.w,
            child: Hero(
              tag: 'abcd',
              child: Material(
                  color: Colors.transparent,
                  child: SearchWidget(
                    hintText: AppLocalizations.of(context)!.search_anything,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class SellerNameWidget extends StatelessWidget {
  const SellerNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      // height: 150.h,
      child: Stack(
        // alignment: Alignment.bottomCenter,
        children: [
          Container(
            // height: 147.h,
            width: double.maxFinite,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: deepYellow,
              image: const DecorationImage(
                alignment: Alignment.bottomCenter,
                image: AssetImage(
                  "assets/images/crops_2.png",
                ),
                fit: BoxFit.cover,
              ),
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(15.r)),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, bottom: 24.h),
              child: Consumer(builder: (context, ref, child) {
                final res = ref.watch(userController(UserPreferences.userId));
                return res.when(
                  data: (user) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        35.verticalSpace,
                        RichText(
                          text: TextSpan(
                            text: "Hi",
                            style: textTheme.bodyLarge!.copyWith(
                              color: white,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: " ${user.name},",
                                style: textTheme.bodyLarge!.copyWith(
                                    color: white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24.sp),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Welcome to Hal Saathi dashboard",
                          style: textTheme.bodyLarge!.copyWith(
                            color: white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    );
                  },
                  error: (_, __) => const SizedBox(),
                  loading: () => const SizedBox(),
                );
              }),
            ),
          ),
          Positioned(
            left: 0.1.w,
            right: 0.1.w,
            top: 120.h,
            child: Container(
                height: 42.h,
                // width: 376,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                )),
          )
        ],
      ),
    );
  }
}

class TextSeller extends StatelessWidget {
  final String text;
  final String count;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final double countSize;

  const TextSeller(
      {required this.text,
      required this.count,
      required this.size,
      required this.countSize,
      required this.fontWeight,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style:
                TextStyle(fontSize: size, fontWeight: fontWeight, color: color),
          ),
          Text(
            count,
            style: TextStyle(
                fontSize: countSize, fontWeight: fontWeight, color: color),
          )
        ],
      ),
    );
  }
}

class SellerCard extends StatelessWidget {
  final String text;
  final String countText;
  final String timeText;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final double countSize;
  final Color countColor;
  final FontWeight timeFontWeight;
  final Color timeColor;

  const SellerCard(
      {required this.text,
      required this.countText,
      required this.timeText,
      required this.size,
      required this.fontWeight,
      required this.color,
      required this.countSize,
      required this.countColor,
      required this.timeFontWeight,
      required this.timeColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 72,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            border: const Border(
                top: BorderSide(
                  color: Color(0xffDEDEDE),
                ),
                bottom: BorderSide(color: Color(0xffDEDEDE)),
                right: BorderSide(color: Color(0xffDEDEDE)),
                left: BorderSide(width: 5, color: Color(0xffE26B26))),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                          fontSize: size, fontWeight: fontWeight, color: color),
                    ),
                    Text(
                      countText,
                      style: TextStyle(
                          fontSize: countSize,
                          fontWeight: fontWeight,
                          color: countColor),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  timeText,
                  style: TextStyle(
                      fontSize: countSize,
                      fontWeight: timeFontWeight,
                      color: color),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListingCard extends StatefulWidget {
  final SellerMylistingModel sellerMylistingModel;

  // final String text;
  // final String statusText;
  // final String timeText;
  // final Color? StatusColor;
  // final Color StatusTextColor;
  // final String Idtext;
  const ListingCard({required this.sellerMylistingModel});

  @override
  State<ListingCard> createState() => _ListingCardState();
}

class _ListingCardState extends State<ListingCard> {
  // final List<String> _months = ['Deactivate', 'Delete'];

  // String _selected = "All";
  SellerMylistingModel? lst;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pagePadding,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 135,
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 227, 227, 227).withOpacity(0.15),
                // ignore: prefer_const_literals_to_create_immutables
                // boxShadow: [
                //   const BoxShadow(
                //     blurRadius: 10,
                //     color: Color.fromRGBO(0, 0, 0, 08),
                //   )
                // ],
                border: Border(
                  left: BorderSide(
                      width: 5,
                      // strokeAlign: StrokeAlign.inside,
                      color:
                          widget.sellerMylistingModel.sellingStatus == "Active"
                              ? const Color(0xffE26B26)
                              : const Color(0xffa6a4a4)),
                )),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 1, bottom: 7, top: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/purchase_order.svg'),
                          10.horizontalSpace,
                          SizedBox(
                            height: 41,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                // 10.horizontalSpace,
                                SizedBox(
                                  height: 19,
                                  child: Text(
                                    widget.sellerMylistingModel.serviceName,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff535353),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  child: Row(
                                    children: [
                                      const Text(
                                        "ID:",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff535353),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      3.horizontalSpace,
                                      Text(
                                        widget.sellerMylistingModel
                                            .sellingProductId,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff535353),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // 148.horizontalSpace,
                                // IconButton(
                                //   onPressed: () {},
                                //   icon: const Icon(Icons.more_vert_outlined),
                                //   // iconSize: 3,
                                //   color: const Color(0xff7a7a7a),
                                // )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Consumer(builder: (context, ref, child) {
                        return PopupMenuButton<int>(
                          elevation: 12,

                          position: PopupMenuPosition.under,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          icon: const Icon(Icons.more_vert_outlined),
                          // color: const Color(0xff7a7a7a),
                          itemBuilder: (context) => [
                            if (widget.sellerMylistingModel.sellingStatus ==
                                "In-active")
                              PopupMenuItem(
                                value: 1,
                                height: 35,
                                onTap: () async {
                                  final val = await ref
                                      .read(droneServiceRepoProvider)
                                      .getSellerStatus();
                                  await ref
                                      .read(stationSellRepoProvider)
                                      .inactiveProductMyseller(
                                          sellerId: val.id,
                                          productId:
                                              widget.sellerMylistingModel.id,
                                          status: "Active");
                                  Utils.farmAddedMessage(
                                      "your product activated now", context);

                                  ref.refresh(sellerListingRepoProvider);
                                  ref.refresh(sellerListingProvider(userId));
                                  final _myListingController = ref.watch(
                                      sellerListingProvider(
                                          UserPreferences.userId));
                                  _myListingController.refresh(context);
                                },
                                child: Container(
                                  height: 52,
                                  width: 64,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Active",
                                          style: TextStyle(
                                              color: Color(0xff535353),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500)),
                                      10.verticalSpace,
                                      const Divider(color: Color(0xff7a7a7a))
                                    ],
                                  ),
                                ),
                              ),
                            if (widget.sellerMylistingModel.sellingStatus ==
                                "Active")
                              PopupMenuItem(
                                value: 1,
                                height: 35,
                                onTap: () async {
                                  final val = await ref
                                      .read(droneServiceRepoProvider)
                                      .getSellerStatus();
                                  await ref
                                      .read(stationSellRepoProvider)
                                      .inactiveProductMyseller(
                                          sellerId: val.id,
                                          productId:
                                              widget.sellerMylistingModel.id,
                                          status: "In-active");
                                  Utils.farmAddedMessage(
                                      "your product deactivate now", context);

                                  ref.refresh(sellerListingRepoProvider);
                                  ref.refresh(sellerListingProvider(userId));
                                  final _myListingController = ref.watch(
                                      sellerListingProvider(
                                          UserPreferences.userId));
                                  _myListingController.refresh(context);
                                },
                                child: Container(
                                  height: 52,
                                  width: 64,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("In-Active",
                                          style: TextStyle(
                                              color: Color(0xff535353),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500)),
                                      10.verticalSpace,
                                      const Divider(color: Color(0xff7a7a7a))
                                    ],
                                  ),
                                ),
                              ),
                            PopupMenuItem(
                              value: 1,
                              height: 30,
                              onTap: () async {
                                final val = await ref
                                    .read(droneServiceRepoProvider)
                                    .getSellerStatus();
                                await ref
                                    .read(stationSellRepoProvider)
                                    .deleteProductMyseller(
                                      sellerId: val.id,
                                      productId: widget.sellerMylistingModel.id,
                                    );
                                ref
                                    .read(sellerListingProvider(
                                        UserPreferences.userId))
                                    .deletePrd(widget.sellerMylistingModel.id);

                                ref.refresh(sellerListingRepoProvider);
                                ref.refresh(sellerListingProvider(userId));
                                final _myListingController = ref.watch(
                                    sellerListingProvider(
                                        UserPreferences.userId));
                                _myListingController.refresh(context);
                              },
                              child: const Text("Delete",
                                  style: TextStyle(
                                      color: Color(0xff535353),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        );
                        // return DropdownButton(
                        //   underline: const SizedBox.shrink(),
                        //   borderRadius: BorderRadius.circular(12),
                        //   elevation: 12,
                        //   icon: const Icon(Icons.more_vert_outlined),

                        //   // hint: Text(
                        //   //   'Monthly',
                        //   //   style: TextStyle(
                        //   //       color: const Color(0xff563e1f),
                        //   //       fontSize: 14.sp,
                        //   //       fontWeight: FontWeight.w400),
                        //   // ),
                        //   // value: _selected,
                        //   onChanged: (newValue) async {
                        //     setState(() async {
                        //       final selected = newValue!;

                        //       if (selected == "Deactivate") {
                        // final val = await ref
                        //     .read(droneServiceRepoProvider)
                        //     .getSellerStatus();
                        // await ref
                        //     .read(stationSellRepoProvider)
                        //     .inactiveProductMyseller(
                        //         sellerId: val.id,
                        //         productId:
                        //             widget.sellerMylistingModel.id,
                        //         status: "In-active");
                        // Utils.farmAddedMessage(
                        //     "your product deactivate now", context);

                        // ref.refresh(sellerListingRepoProvider);
                        // ref.refresh(sellerListingProvider(userId));
                        // final _myListingController = ref.watch(
                        //     sellerListingProvider(
                        //         UserPreferences.userId));
                        // _myListingController.refresh(context);
                        //       } else {
                        //         return;
                        //       }
                        //       if (selected == "Delete") {
                        //         final val = await ref
                        //             .read(droneServiceRepoProvider)
                        //             .getSellerStatus();
                        //         await ref
                        //             .read(stationSellRepoProvider)
                        //             .deleteProductMyseller(
                        //               sellerId: val.id,
                        //               productId: widget.sellerMylistingModel.id,
                        //             );
                        //         ref
                        //             .read(sellerListingProvider(
                        //                 UserPreferences.userId))
                        //             .deletePrd(widget.sellerMylistingModel.id);

                        //         ref.refresh(sellerListingRepoProvider);
                        //         ref.refresh(sellerListingProvider(userId));
                        //         final _myListingController = ref.watch(
                        //             sellerListingProvider(
                        //                 UserPreferences.userId));
                        //         _myListingController.refresh(context);
                        //       } else {
                        //         return;
                        //       }
                        //       //   ref.refresh(sellerListingRepoProvider);
                        //       //   ref.refresh(sellerListingProvider(userId));
                        //       //   final _myListingController = ref.watch(
                        //       //       sellerListingProvider(
                        //       //           UserPreferences.userId));
                        //       //   _myListingController.refresh(context);
                        //     });

                        //     // final _myListingController = ref.watch(
                        //     //     sellerListingProvider(UserPreferences.userId));
                        //     // _myListingController.refresh(context);
                        //   },
                        //   items: _months.map((months) {
                        //     return DropdownMenuItem(
                        //       value: months,
                        //       child: Padding(
                        //         padding: const EdgeInsets.all(7.0),
                        //         child: Container(
                        //           height: 50,
                        //           width: 62,
                        //           decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(12)),
                        //           child: Text(
                        //             months,
                        //             style: const TextStyle(
                        //                 color: Color(0xff535353),
                        //                 fontSize: 13,
                        //                 fontWeight: FontWeight.w500),
                        //           ),
                        //         ),
                        //       ),
                        //     );
                        //   }).toList(),
                        // );
                      })
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     25.horizontalSpace,
                  //     const Text(
                  //       "ID: 26355",
                  //       style: TextStyle(
                  //         fontSize: 12,
                  //         color: Color(0xff535353),
                  //         fontWeight: FontWeight.w400,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  1.verticalSpace,
                  const Divider(
                    color: Color(0xffdedede),
                    thickness: 0.5,
                  ),
                  2.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Status:",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff535353),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  5.horizontalSpace,
                                  SizedBox(
                                    height: 18,
                                    width: 70,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: widget
                                                    .sellerMylistingModel
                                                    .sellingStatus ==
                                                "Active"
                                            ? const Color(0xff24da57)
                                                .withOpacity(0.1)
                                            : const Color(0xffcfcfcf)
                                                .withOpacity(0.3),

                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ), // background
                                      ),
                                      onPressed: () {
                                        // context.pushRoute(const SellerSubmitRoute());
                                      },
                                      child: Text(
                                          widget.sellerMylistingModel
                                              .sellingStatus,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: widget.sellerMylistingModel
                                                          .sellingStatus ==
                                                      "Active"
                                                  ? const Color(0xff1ca463)
                                                  : const Color(0xff8e8e8e),
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                ],
                              ),
                              8.verticalSpace,
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text("Last Updated:",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff9b9b9b),
                                          fontWeight: FontWeight.w500)),
                                  5.horizontalSpace,
                                  Text(
                                      DateFormat('dd-MM-yyyy').format(widget
                                          .sellerMylistingModel.modifiedTime),
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff535353),
                                          fontWeight: FontWeight.w500)),
                                  // 100.horizontalSpace,
                                ],
                              ),
                            ],
                          ),
                        ),
                        // 70.horizontalSpace,
                        GestureDetector(
                          onTap: (){
                            context.pushRoute(ListingDetailsRoute(
                                droneId: widget.sellerMylistingModel.id));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Color(0xffe26b26))
                            ),
                            child: Text(
                                'View Details',
                                style: TextStyle(
                                  // letterSpacing: -1,
                                    fontSize: 12,
                                    color: Color(0xffe26b26),
                                    fontWeight: FontWeight.w500)
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 28,
                        //   width: 95,
                        //   child: ElevatedButton(
                        //     style: ElevatedButton.styleFrom(
                        //       side: const BorderSide(
                        //           color: Color(0xffe26b26)),
                        //       elevation: 0,
                        //       backgroundColor: Colors.white,
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(30.0),
                        //       ), // background
                        //     ),
                        //     onPressed: () {
                        //
                        //     },
                        //     child: const Text('View Details',
                        //         style: TextStyle(
                        //             // letterSpacing: -1,
                        //             fontSize: 12,
                        //             color: Color(0xffe26b26),
                        //             fontWeight: FontWeight.w500)),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  3.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OrderListCard extends ConsumerStatefulWidget {
  final SellerOrderlistModel sellerOrderlistModel;
  const OrderListCard({required this.sellerOrderlistModel});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrderListCardState();
}

class _OrderListCardState extends ConsumerState<OrderListCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.sellerOrderlistModel.orderStatus != "Cancelled") {
          context.router.push(SellerHistoryOrderDetailsRoute(
              orderId: widget.sellerOrderlistModel.id));
        } else {
          Utils.farmAddedMessage("you can not view cancel order", context);
        }
      },
      child: SizedBox(
        child: Container(
          height: 132.h,
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            border: Border.all(
              color: const Color(0xffcccccc),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(13.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                if (widget.sellerOrderlistModel.orderStatus ==
                                    "Delivered")
                                  SvgPicture.asset(
                                      'assets/images/tick-circle.svg'),
                                if (widget.sellerOrderlistModel.orderStatus ==
                                    "Pending")
                                  SvgPicture.asset(
                                      'assets/images/more-circle.svg'),
                                if (widget.sellerOrderlistModel.orderStatus ==
                                    "Cancelled")
                                  SvgPicture.asset(
                                      'assets/images/close-circle.svg'),
                                5.horizontalSpace,
                                Text(
                                  widget.sellerOrderlistModel.serviceName,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff563e1f),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(widget.sellerOrderlistModel.bookingDate,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xff686868),
                            fontWeight: FontWeight.w400))
                  ],
                ),
                4.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 26.0),
                  child: SizedBox(
                    height: 17,
                    child: Row(
                      children: [
                        const Text(
                          "ID:",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff909090),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        3.horizontalSpace,
                        Text(
                          widget.sellerOrderlistModel.bookingId,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xff909090),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // for showing pending details
                        // 7.horizontalSpace,
                        // const Padding(
                        //   padding: const EdgeInsets.only(top: 4.0),
                        //   child: Icon(
                        //     Icons.circle,
                        //     color: Color(0xffd9d9d9),
                        //     size: 12,
                        //   ),
                        // ),
                        // 5.horizontalSpace,
                        // const Text(
                        //   "Pending: ",
                        //   style: TextStyle(
                        //     fontSize: 12,
                        //     color: Color(0xff404040),
                        //     fontWeight: FontWeight.w700,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                // 2.verticalSpace,
                const Divider(color: Color(0xffcccccc), thickness: 0.5),
                // 2.verticalSpace,
                SizedBox(
                  height: 19.h,
                  child: Text(widget.sellerOrderlistModel.farmLocation.address,
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xff656565),
                          fontWeight: FontWeight.w400)),
                ),
                SizedBox(
                  height: 20.h,
                  child: Row(
                    children: [
                      Text("Payments : ",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w600)),
                      3.horizontalSpace,
                      Text(
                          widget.sellerOrderlistModel.estimatedPrice.toString(),
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xff656565),
                              fontWeight: FontWeight.w600)),
                      3.horizontalSpace,
                      Text("|",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xff656565),
                              fontWeight: FontWeight.w600)),
                      3.horizontalSpace,
                      Text(widget.sellerOrderlistModel.orderStatus,
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xff656565),
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OngoindOrderList extends ConsumerStatefulWidget {
  const OngoindOrderList({required this.sellerOrderlistModel});

  final SellerOrderlistModel sellerOrderlistModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OngoindOrderListState();
}

class _OngoindOrderListState extends ConsumerState<OngoindOrderList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(SellerSingleOrderDetailsRoute(
            sellerOrderlistModel: widget.sellerOrderlistModel));
      },
      child: Card(
        // elevation: ,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: const Color(0xfff0f0f0), width: 2.w),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SizedBox(
          height: 150.h,
          child: Column(
            children: [
              SizedBox(
                height: 72.h,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 70.h,
                        width: 60.w,
                        child: IconButton(
                            onPressed: () {
                              context.router.push(const ProfileRoute());
                            },
                            icon:
                                widget.sellerOrderlistModel.buyerProfileImage ==
                                        null
                                    ? ProfilePicWidget(
                                        url: widget.sellerOrderlistModel
                                            .buyerProfileImage,
                                        size: 70.h,
                                        fizedSize: true,
                                      )
                                    : const CircleAvatar()),
                      ),
                      SizedBox(
                        height: 55.h,
                        width: 140.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.sellerOrderlistModel.buyerName,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: const Color(0xff341d10),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              widget.sellerOrderlistModel.bookingId,
                              style: TextStyle(
                                  color: const Color(0xff848484),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Column(
                          children: [
                            25.verticalSpace,
                            Text(
                              textAlign: TextAlign.end,
                              widget.sellerOrderlistModel.estimatedPrice
                                  .toString(),
                              style: TextStyle(
                                  color: const Color(0xffe26b26),
                                  fontSize: 14.sp,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Color(0xffdedede),
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/drone_final.svg',
                      height: 8,
                    ),
                    10.horizontalSpace,
                    Text(
                      widget.sellerOrderlistModel.serviceName,
                      style: TextStyle(
                          color: const Color(0xff563e1f),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              7.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/location1.svg',
                      height: 17,
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: Text(
                        widget.sellerOrderlistModel.farmLocation.address,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: const Color(0xff563e1f),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderAreaCard extends ConsumerStatefulWidget {
  const OrderAreaCard({required this.farmDetail, super.key});

  final FarmDetail farmDetail;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrderAreaCardState();
}

class _OrderAreaCardState extends ConsumerState<OrderAreaCard> {
  bool isReadonly = true;
  final farmEditingController1 = TextEditingController();

  @override
  void initState() {
    super.initState();
    calculateArea();
  }

  void calculateArea() {
    final initailArea = widget.farmDetail.area.toString();
    // print(initailArea);
    farmEditingController1.text = "$initailArea  Acre";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                widget.farmDetail.farmName,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: const Color(0xff756e7b),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              // height: 22,
              width: 270,
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                readOnly: isReadonly,
                controller: farmEditingController1,
                textAlign: TextAlign.center,
              ),
            ),
            InkWell(
              onTap: () {
                isReadonly = false;
                print("write");
              },
              child: Text(
                "Edit",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: const Color(0xff756e7b),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        3.verticalSpace,
        const Divider(
          color: Color(0xffe4e4e4),
          height: 2,
          thickness: 1,
        ),
        5.verticalSpace,
      ],
    );
    // return Row(
    //                       children: [
    //                         Container(
    //                           width: 290.w,
    //                           padding: const EdgeInsets.symmetric(
    //                               horizontal: 10, vertical: 10),
    //                           decoration: BoxDecoration(
    //                               color: const Color(0xffF9F9F9),
    //                               borderRadius: BorderRadius.circular(8.r)),
    //                           child: Row(
    //                             children: [
    //                               const Text(
    //                                 'Name: ',
    //                                 style: TextStyle(color: grey),
    //                               ),
    //                               SizedBox(
    //                                   width: 80.w,
    //                                   child: Text(
    //                                     widget.sellerOrderlistModel.farmDetails.map((e) => e.farmName +   e.area.toString()).toString(),
    //                                     overflow: TextOverflow.ellipsis,
    //                                   )),
    //                               10.horizontalSpace,
    //                               const Text(
    //                                 'Area: ',
    //                                 style: TextStyle(color: grey),
    //                               ),
    //                               SizedBox(
    //                                 width: 100.w,
    //                                 child: Text(
    //                                   widget.sellerOrderlistModel.farmDetails.map((e) => e.area).toString(),

    //                                   overflow: TextOverflow.ellipsis,
    //                                 ),
    //                               )
    //                             ],
    //                           ),
    //                         ),
    //                         IconButton(
    //                             onPressed: () {
    //                               setState(() {});
    //                               // _farmDetailList.removeAt(index)

    //                             },
    //                             icon: const Icon(Icons.close))
    //                       ],
    //                     );
  }
}
