import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/model/station/seller_orderlist_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/router/router.gr.dart';
import '../../widget/profile_image.dart';

@RoutePage()
class SellerSingleOrderDetailsPage extends ConsumerWidget {
  const SellerSingleOrderDetailsPage(
      {required this.sellerOrderlistModel, super.key});

  final SellerOrderlistModel sellerOrderlistModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: Color(0xff585858),
            )),
        centerTitle: false,
        title: Text(
          "Order: ${sellerOrderlistModel.bookingId}",
          style: TextStyle(
            fontSize: 20.sp,
            color: const Color(0xff563e1f),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            8.verticalSpace,

            Container(
                height: 76,
                // width: 350,
                decoration: BoxDecoration(
                  color: const Color(0xfff8f8f8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 80,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.,
                          children: [
                            SizedBox(
                              height: 80,
                              // width: 60,
                              child: IconButton(
                                  onPressed: () {
                                    context.router.push(const ProfileRoute());
                                  },
                                  icon:
                                      sellerOrderlistModel.buyerProfileImage ==
                                              null
                                          ? ProfilePicWidget(
                                              url: sellerOrderlistModel
                                                  .buyerProfileImage,
                                              size: 70.h,
                                              fizedSize: true,
                                            )
                                          : const CircleAvatar()),
                            ),

                            5.horizontalSpace,
                            SizedBox(
                              height: 70,
                              // width: 120,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    sellerOrderlistModel.buyerName,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: const Color(0xff341d10),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "#${sellerOrderlistModel.bookingId}",
                                    style: TextStyle(
                                        color: const Color(0xff848484),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            // 120.horizontalSpace,
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          print(sellerOrderlistModel.mobileNo);
                          // final Uri contactUrl = Uri(
                          //   scheme: 'tel',
                          //   path: sellerOrderlistModel.mobileNo,
                          // );
                          // await launchUrl(contactUrl);

                          // context.router.push(const ProfileRoute());
                        },
                        icon: SvgPicture.asset(
                          'assets/images/Order-call.svg',
                          height: 80,
                        ),
                      ),
                    ],
                  ),
                )),
            8.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/drone-details.svg',
                      ),
                      5.horizontalSpace,
                      // Container(
                      //   height: 20,
                      //   width: 46,
                      //   decoration: BoxDecoration(
                      //     color: const Color(0xff3a974c).withOpacity(0.2),
                      //     borderRadius: BorderRadius.circular(40),
                      //   ),
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(
                      //         left: 12, top: 1, right: 6, bottom: 4),
                      //     child: Text(
                      //       "Paid",
                      //       style: TextStyle(
                      //           color: const Color(0xff3a974c),
                      //           fontSize: 12.sp,
                      //           fontWeight: FontWeight.w400),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Text(
                  "₹${sellerOrderlistModel.estimatedPrice}",
                  style: TextStyle(
                      color: const Color(0xffe48912),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            15.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order Details",
                  style: TextStyle(
                      color: const Color(0xff200e32),
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "View Less",
                  style: TextStyle(
                      color: const Color(0xff777777),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),

            12.verticalSpace,
            Text(
              "Delivery Address:",
              style: TextStyle(
                  color: const Color(0xff969696),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
            ),
            8.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: SvgPicture.asset(
                          'assets/images/Loc-1.svg',
                          height: 17,
                        ),
                      ),
                      8.horizontalSpace,
                      SizedBox(
                        // height: 63,
                        width: 130,
                        child: Text(
                          sellerOrderlistModel.farmLocation.address,
                          style: TextStyle(
                              color: const Color(0xff563e1f),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 6.0),
                //   child: SizedBox(
                //     child: Row(
                //       // crossAxisAlignment: CrossAxisAlignment.start,
                //       // mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         SvgPicture.asset(
                //           'assets/images/Get-d.svg',
                //           height: 17,
                //         ),
                //         10.horizontalSpace,
                //         Text(
                //           'Get Directions',
                //           style: TextStyle(
                //               color: const Color(0xffe26b26),
                //               fontSize: 12.sp,
                //               fontWeight: FontWeight.w600),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
            5.verticalSpace,
            const Divider(
              color: Color(0xffdfdfdf),
              thickness: 1,
            ),
            CardText(
                text: "Booking Date & Time:",
                otherText:
                    "${sellerOrderlistModel.bookingDate} | ${sellerOrderlistModel.bookingTime}"),
            5.verticalSpace,
            const Divider(
              color: Color(0xffdfdfdf),
              thickness: 1,
            ),
            CardText(
              text:
                  "Farm Details (0${sellerOrderlistModel.farmDetails.length}):",
              otherText:
                  "${sellerOrderlistModel.farmDetails.first.farmName} - ${sellerOrderlistModel.farmDetails.first.area} Acre  ",
            ),
            5.verticalSpace,
            const Divider(
              color: Color(0xffdfdfdf),
              thickness: 1,
            ),
            CardText(
                text: "Crop Type:", otherText: sellerOrderlistModel.cropType),
            5.verticalSpace,
            const Divider(
              color: Color(0xffdfdfdf),
              thickness: 1,
            ),
            CardText(
                text: "Spray Product:",
                otherText: "${sellerOrderlistModel.sparyProduct} |"),
            5.verticalSpace,
            const Divider(
              color: Color(0xffdfdfdf),
              thickness: 1,
            ),
            5.verticalSpace,
            Text(
              "Order amount",
              style: TextStyle(
                  color: const Color(0xff969696),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                Text(
                  sellerOrderlistModel.estimatedPrice.toString(),
                  style: TextStyle(
                      color: const Color(0xff563e1f),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                ),
                5.horizontalSpace,
                // Container(
                //   height: 20,
                //   width: 46,
                //   decoration: BoxDecoration(
                //     color: const Color(0xff3a974c).withOpacity(0.2),
                //     borderRadius: BorderRadius.circular(40),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         left: 12, top: 1, right: 6, bottom: 4),
                //     child: Text(
                //       "Paid",
                //       style: TextStyle(
                //           color: const Color(0xff3a974c),
                //           fontSize: 12.sp,
                //           fontWeight: FontWeight.w400),
                //     ),
                //   ),
                // )
              ],
            ),
            3.verticalSpace,
            const Divider(
              color: Color(0xffdfdfdf),
              thickness: 1,
            ),
            10.verticalSpace,
            Center(
              child: SizedBox(
                height: 48,
                width: 308,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffe26b26),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      // background
                    ),
                    onPressed: () {
                      context.router.push(SellerOrderCompleteRoute(
                          sellerOrderlistModel: sellerOrderlistModel));
                    },
                    child: const Text('Complete Order',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500))),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     SizedBox(
            //       height: 42,
            //       width: 104,
            //       child: ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: const Color(0xffe8e8e8),
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(40.0),
            //             ),
            //             // background
            //           ),
            //           onPressed: () {},
            //           child: const Text('Reject',
            //               style: TextStyle(
            //                   fontSize: 14,
            //                   color: Color(0xff626262),
            //                   fontWeight: FontWeight.w500))),
            //     ),

            //   ],
            // ),
          ],
        ),
      )),
    );
  }
}

class CardText extends StatelessWidget {
  final String text;
  final String otherText;
  const CardText({required this.text, required this.otherText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
              color: const Color(0xff969696),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
        ),
        8.horizontalSpace,
        Text(
          otherText,
          style: TextStyle(
              color: const Color(0xff563e1f),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
