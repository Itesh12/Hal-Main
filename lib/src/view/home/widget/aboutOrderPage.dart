import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/view/home/widget/sellerOederDetails.dart';

import '../../../app/router/router.gr.dart';
import '../../../util/services/shared_preferences.dart';
import '../../widget/profile_image.dart';

@RoutePage()
class AboutOrderPage extends ConsumerWidget {
  const AboutOrderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 25,
              color: Color(0xff585858),
            )),

        // centerTitle: true,
        title: Text(
          "Order: 263451",
          style: TextStyle(
            fontSize: 20.sp,
            color: const Color(0xff563e1f),
            fontWeight: FontWeight.w600,
          ),
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
                  Container(
                      height: 76,
                      // width: 350,
                      decoration: BoxDecoration(
                        color: const Color(0xfff8f8f8).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 10.0, top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 90,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.,
                                children: [
                                  SizedBox(
                                    // height: 100,
                                    // width: 100,
                                    child: IconButton(
                                      onPressed: () {
                                        context.router
                                            .push(const ProfileRoute());
                                      },
                                      icon: ProfilePicWidget(
                                        url: UserPreferences.profilePic,
                                        size: 100.h,
                                        fizedSize: true,
                                      ),
                                    ),
                                  ),
                                  5.horizontalSpace,
                                  SizedBox(
                                    height: 70,
                                    // width: 120,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          UserPreferences.userName,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: const Color(0xff341d10),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "View Order Details",
                                          style: TextStyle(
                                              color: const Color(0xffe26b26),
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // 120.horizontalSpace,
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: IconButton(
                                color: const Color(0xfff2f2f2),
                                onPressed: () {
                                  // context.router.push(const ProfileRoute());
                                },
                                icon: SvgPicture.asset(
                                  'assets/images/call-grey.svg',
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  8.horizontalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Payment Amount",
                        style: TextStyle(
                            color: const Color(0xff563e1f),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 25,
                        child: Row(
                          children: [
                            Text(
                              "₹2,600",
                              style: TextStyle(
                                  color: const Color(0xff563e1f),
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            8.horizontalSpace,
                            Container(
                              height: 20,
                              width: 46,
                              decoration: BoxDecoration(
                                color: const Color(0xff3a974c).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, top: 1, right: 6, bottom: 4),
                                child: Text(
                                  "Paid",
                                  style: TextStyle(
                                      color: const Color(0xff3a974c),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  const CardText(
                      text: "Delivery Date & Time:",
                      otherText: "12 Aug’22  |  9:00PM - 6:00 PM"),
                ],
              ),
            ),
            12.verticalSpace,
            const Divider(
              color: Color(0xffdfdfdf),
              thickness: 1,
            ),
            20.verticalSpace,
            Padding(
              padding: pagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrderStepsIndicator(
                    title: 'Delivery Address:',
                    isComplete: true,
                    otherText: 'Sector 65,Muradpur, Uttar Pradesh, 182837 ',
                    buttonicon: 'direction-b',
                    icon: 'Loc-1',
                    otherColor: const Color(0xff563e1f),
                    titleColor: const Color(0xff969696),
                    onTap: () {
                      showDialogIfOtp(context);
                    },
                  ),
                  OrderStepsIndicator(
                    title: 'Reached Delivery Location',
                    // isComplete: true,
                    othericon: 'cancel-b',
                    otherText: 'To start Delivery ask the costumer for OTP',
                    buttonicon: 'start-d', otherColor: const Color(0xff969696),
                    titleColor: const Color(0xff563e1f),
                    onTap: () {
                      debugPrint("delivery reached");
                    },
                    // icon: 'Loc-1',
                  ),
                  OrderStepsIndicator(
                    isLast: true,
                    title: 'End delivery',
                    // isComplete: true,
                    otherText: 'Before completing the delivery take payment',
                    buttonicon: 'complete-order',
                    otherColor: const Color(0xff969696),
                    titleColor: const Color(0xff563e1f),
                    onTap: () {
                      // context.router.push(const OrderSubmitRoute());
                    },
                    // icon: 'Loc-1',
                  ),
                  // SizedBox(
                  //   child: Row(
                  //     children: [
                  //       SvgPicture.asset(
                  //         'assets/images/start-elipse.svg',
                  //         height: 17,
                  //       ),
                  //       5.horizontalSpace,
                  //       // Text(
                  //       //   "Delivery Address:",
                  //       //   style: TextStyle(
                  //       //       color: const Color(0xff969696),
                  //       //       fontSize: 14.sp,
                  //       //       fontWeight: FontWeight.w500),
                  //       // ),
                  //     ],
                  //   ),
                  // ),
                  // 3.horizontalSpace,
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [

                  //     Padding(
                  //       padding: const EdgeInsets.only(),
                  //       child: SizedBox(
                  //         child: Row(
                  //           children: [
                  //             SvgPicture.asset(
                  //               'assets/images/Loc-1.svg',
                  //               height: 17,
                  //             ),
                  //             8.horizontalSpace,
                  //             Text(
                  //               '22, Sector 65 muradpur uttar pradesh ',
                  //               style: TextStyle(
                  //                   color: const Color(0xff563e1f),
                  //                   fontSize: 14.sp,
                  //                   fontWeight: FontWeight.w500),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderStepsIndicator extends StatelessWidget {
  const OrderStepsIndicator(
      {Key? key,
      this.isLast = false,
      required this.title,
      this.icon,
      this.isComplete = false,
      required this.buttonicon,
      required this.otherText,
      this.othericon,
      required this.titleColor,
      required this.otherColor,
      required this.onTap})
      : super(key: key);

  final bool isLast;
  final VoidCallback onTap;

  final String buttonicon;
  final String otherText;
  final Color otherColor;
  final Color titleColor;
  final String title;
  final String? icon;
  final bool isComplete;
  final String? othericon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            if (isComplete)
              SvgPicture.asset(
                'assets/images/start-elipse.svg',
                height: 22.h,
              )
            else
              Container(
                height: 22.h,
                width: 22.h,
                decoration: const BoxDecoration(
                    color: Color(0xffD9D9D9), shape: BoxShape.circle),
              ),
            if (!isLast)
              SizedBox(
                width: 1,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        color: const Color(0xffB0B0B0),
                        height: 16,
                        width: 1,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 4,
                      );
                    },
                    itemCount: 6),
              ),
          ],
        ),
        10.horizontalSpace,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: const Color(0xff969696),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: onTap,
                        child: SvgPicture.asset(
                          'assets/images/$icon.svg',
                          height: 17,
                        ),
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
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50.0, top: 20, bottom: 30),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: onTap,
                          child: SvgPicture.asset(
                            'assets/images/$buttonicon.svg',
                            height: 32,
                          ),
                        ),
                        10.horizontalSpace,
                        InkWell(
                          onTap: onTap,
                          child: SvgPicture.asset(
                            'assets/images/$othericon.svg',
                            height: 32,
                          ),
                        ),
                        // 20.verticalSpace,
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Text(
            //   "9:25 PM | 10 Aug'22",
            //   style: TextStyle(color: const Color(0xff8F8F8F), fontSize: 12.sp),
            // ),
          ],
        ),
      ],
    );
  }
}

class OtpBox extends ConsumerWidget {
  const OtpBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final focus = FocusNode();
    return Container(
      // alignment: Alignment.center,3
      height: 48,
      width: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xffd6d6d6))),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextField(
          // autofocus: true,
          cursorColor: Colors.white,
          cursorHeight: 1,
          textInputAction: TextInputAction.next,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          // onSubmitted: (v) {
          //   FocusScope.of(context).nextFocus();
          // },
          style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 32,
              color: Color(0xfff39a00)),
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: '-',
            hintStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 32,
                color: Color(0xfff39a00)),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

Future<void> showDialogIfOtp(BuildContext context) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: SizedBox(
          height: 270,
          width: 345,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Enter Verification Code",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color(
                      0xff563e1f,
                    )),
              ),
              13.verticalSpace,
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OtpBox(),
                  SizedBox(
                    width: 5,
                  ),
                  OtpBox(),
                  SizedBox(
                    width: 5,
                  ),
                  OtpBox(),
                  SizedBox(
                    width: 5,
                  ),
                  OtpBox(),
                ],
              ),
              21.verticalSpace,
              SizedBox(
                height: 48,
                width: 287,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffe26b26),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(34.0),
                      ),
                      // background
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Submit',
                        style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 0.21,
                            color: Colors.white,
                            fontWeight: FontWeight.w500))),
              ),
            ],
          ),
        ),
      );
    },
  );
}
