import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:kisaan_station/src/model/station/seller_orderlist_model.dart';

import '../../../app/router/router.gr.dart';
import '../../widget/profile_image.dart';

@RoutePage()
class OrderSubmitPage extends StatelessWidget {
  const OrderSubmitPage({required this.sellerOrderlistModel, super.key});
  final SellerOrderlistModel sellerOrderlistModel;

  @override
  Widget build(BuildContext context) {
    final String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
    final String currentTime = DateFormat('hh:mm:ss').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color(0xffdfdfdf),
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: const Color(0xffdfdfdf),
          centerTitle: false,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                context.router.popUntilRoot();
              },
              icon: const Icon(Icons.close))),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 310,
              color: const Color(0xffdfdfdf).withOpacity(0.2),
              child: Column(
                children: [
                  40.verticalSpace,
                  Center(child: SvgPicture.asset('assets/images/submit.svg')),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 80,
                      child: Column(
                        children: [
                          const Text(
                            "Order Delivered!",
                            style: TextStyle(
                                letterSpacing: -1,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff563f1f)),
                          ),
                          // const SizedBox(height: 1),
                          Flexible(
                            child: Text(
                              "Order No: ${sellerOrderlistModel.bookingId} - $currentDate| $currentTime",
                              style: TextStyle(
                                  letterSpacing: -0.5,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff563f1f)),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Costumer Details",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff563f1f)),
                  ),
                  // 20.verticalSpace,
                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: IconButton(
                            onPressed: () {
                              context.router.push(const ProfileRoute());
                            },
                            icon: sellerOrderlistModel.buyerProfileImage == null
                                ? ProfilePicWidget(
                                    url: sellerOrderlistModel.buyerProfileImage,
                                    size: 70.h,
                                    fizedSize: true,
                                  )
                                : const CircleAvatar()),
                      ),
                      8.horizontalSpace,
                      Text(
                        sellerOrderlistModel.buyerName,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: const Color(0xff341d10),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  5.verticalSpace,
                  const Divider(
                    color: Color(0xffd6d6d6),
                    thickness: 1,
                  ),
                  5.verticalSpace,
                  const Text(
                    "Service Name",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff563f1f)),
                  ),
                  5.verticalSpace,
                  Text(
                    sellerOrderlistModel.serviceName,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff563f1f)),
                  ),
                  5.verticalSpace,
                  const Divider(
                    color: Color(0xffd6d6d6),
                    thickness: 1,
                  ),
                  5.verticalSpace,
                  const Text(
                    "Delivery Location",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff563f1f)),
                  ),
                  10.verticalSpace,
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: SvgPicture.asset(
                          'assets/images/Loc-1.svg',
                          height: 17,
                        ),
                      ),
                      8.horizontalSpace,
                      Text(
                        sellerOrderlistModel.farmLocation.address,
                        style: const TextStyle(
                            color: Color(0xff563e1f),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  5.verticalSpace,
                  const Divider(
                    color: Color(0xffd6d6d6),
                    thickness: 1,
                  ),
                  5.verticalSpace,
                  const Text(
                    'Total Amount',
                    style: TextStyle(
                        color: Color(0xff563e1f),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  10.verticalSpace,
                  Text(
                    sellerOrderlistModel.estimatedPrice.toString(),
                    style: const TextStyle(
                        color: Color(0xffe48912),
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: SizedBox(
                      height: 48,
                      width: 308,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xffffeacd),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26.0),
                          ), // background
                        ),
                        onPressed: () {
                          context.router.popUntilRoot();
                        },
                        child: const Text('Back to Home',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xffe26b26),
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
