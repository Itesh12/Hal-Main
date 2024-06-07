import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../app/router/router.gr.dart';
import '../../../l10n/l10n.dart';
import '../../../model/station/seller_status_model.dart';
import '../../../util/services/shared_preferences.dart';
import '../../widget/profile_image.dart';

@RoutePage()
class SellerAccountPage extends ConsumerStatefulWidget {
  const SellerAccountPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SellerAccountState();
}

class _SellerAccountState extends ConsumerState<SellerAccountPage> {
  bool status = false;

  bool seller_mode = true;

  bool availStatus = true;

  SellerStatusModel? sellerStatusModel;
  final remainingtextController = TextEditingController();
  @override
  void initState() {
    super.initState();

    _getData();
  }

  Future<void> _getData() async {
    final val = await ref.read(droneServiceRepoProvider).getSellerStatus();
    try {
      sellerStatusModel =
          await ref.read(droneServiceRepoProvider).getSellerStatus();
      setState(() {});
      print("debug coming");
    } on Exception {
      // TODO
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      onVisibilityChanged: (info) {
        debugPrint("home visible: ${info.visibleFraction}");
        if (info.visibleFraction == 1.0) {
          SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
            statusBarColor: deepYellow,
          ));
        } else {
          SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white,
          ));
        }
      },
      key: UniqueKey(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                height: 145.h,
                color: deepYellow,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 8),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: SizedBox(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 70.h,
                                width: 70.w,
                                child: IconButton(
                                  onPressed: () {
                                    context.router
                                        .push(const SellerProfileRoute());
                                  },
                                  icon: ProfilePicWidget(
                                    url: UserPreferences.profilePic,
                                    size: 70,
                                    fizedSize: true,
                                  ),
                                ),
                              ),
                              8.horizontalSpace,
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      UserPreferences.userName,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      sellerStatusModel?.spid ??
                                          UserPreferences.userId
                                              .substring(0, 8),
                                      // textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              // 140.horizontalSpace,
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.only(top: 11.0, right: 17),
                              //   child: InkWell(
                              //     child: Column(
                              //       children: [
                              //         SvgPicture.asset(
                              //           'assets/images/editSquare.svg',
                              //           height: 20,
                              //           color: Colors.white,
                              //         ),
                              //         Text(
                              //           "Edit",
                              //           style: TextStyle(
                              //               color: Colors.white,
                              //               fontSize: 14.sp,
                              //               fontWeight: FontWeight.w400),
                              //         )
                              //       ],
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // bottom: 1.h,
                left: 0.1.w,
                right: 0.1.w,
                top: 112.h,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  // width: 376,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 15, top: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: const Color(0xffFEF9EE),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r))),
                        child: Center(
                            child:
                                SvgPicture.asset('assets/images/seller.svg')),
                      ),
                      15.horizontalSpace,
                      const Text(
                        "Hal Saathi Mode",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff563E1F)),
                      ),
                      const Spacer(),
                      FlutterSwitch(
                          width: 43.0.w,
                          height: 22.0.h,
                          valueFontSize: 40.0.sp,
                          toggleSize: 22.0.h,
                          value: seller_mode,
                          borderRadius: 18.0,
                          padding: 3.0,
                          activeColor: const Color(0xffE26B26),
                          inactiveColor: const Color(0xffB6B6B6),
                          showOnOff: true,
                          onToggle: (val) {
                            setState(() {
                              seller_mode = val;
                              if (!seller_mode) {
                                Navigator.pop(context, true);
                                context.router
                                    .replaceAll([const KisaanHomeRoute()]);
                              }
                              setState(() {
                                seller_mode = true;
                              });
                            });
                          })
                    ],
                  ),
                  22.verticalSpace,
                  Row(
                    children: [
                      Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: const Color(0xffFEF9EE),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r))),
                        child: Center(
                            child: SvgPicture.asset(
                                'assets/images/avaibilty.svg')),
                      ),
                      15.horizontalSpace,
                      const Text(
                        "Avalibility Status",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff563E1F)),
                      ),
                      const Spacer(),
                      SizedBox(
                        child: Row(
                          children: [
                            if (availStatus)
                              const Text(
                                "Online",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffa6a4a4)),
                              )
                            else
                              const Text(
                                "Offline",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffa6a4a4)),
                              ),
                            12.horizontalSpace,
                            FlutterSwitch(
                                width: 43.0.w,
                                height: 22.0.h,
                                valueFontSize: 40.0.sp,
                                toggleSize: 22.0.h,
                                value: availStatus,
                                borderRadius: 18.0,
                                padding: 3.0,
                                activeColor: const Color(0xffE26B26),
                                inactiveColor: const Color(0xffB6B6B6),
                                showOnOff: true,
                                onToggle: (val) async {
                                  final seller = await ref
                                      .read(droneServiceRepoProvider)
                                      .getSellerStatus();
                                  availStatus = val;

                                  try {
                                    if (val) {
                                      await ref
                                          .read(stationSellRepoProvider)
                                          .inactiveActiveSeller(
                                              sellerId: seller.id,
                                              status: "Active");
                                      ref.refresh(sellerStatusProvider);
                                    } else {
                                      await ref
                                          .read(stationSellRepoProvider)
                                          .inactiveActiveSeller(
                                              sellerId: seller.id,
                                              status: "In-active");
                                    }

                                    setState(() {});
                                    print("debug coming");
                                  } on Exception catch (e) {
                                    debugPrint(e.toString());
                                  }
                                  ref.refresh(sellerStatusRepoProvider);
                                  setState(() {});
                                }),
                          ],
                        ),
                      )
                    ],
                  ),
                  22.verticalSpace,
                  Row(
                    children: [
                      Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: const Color(0xffFEF9EE),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r))),
                        child: Center(
                          child:
                              SvgPicture.asset('assets/images/myAccount.svg'),
                        ),
                      ),
                      15.horizontalSpace,
                      const Text(
                        "My Profile",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff563E1F)),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            context.router.push(const SellerProfileRoute());
                          },
                          icon: const Icon(Icons.arrow_forward_ios,
                              size: 20, color: Color(0xff563E1F)))
                    ],
                  ),
                  22.verticalSpace,
                  Row(
                    children: [
                      Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: const Color(0xffFEF9EE),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r))),
                        child: Center(
                          child:
                              SvgPicture.asset('assets/images/helpcenter.svg'),
                        ),
                      ),
                      15.horizontalSpace,
                      const Text(
                        "Hal Saathi Help Center ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff563E1F)),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios,
                              size: 20, color: Color(0xff563E1F)))
                    ],
                  ),
                  22.verticalSpace,
                  Row(
                    children: [
                      Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: const Color(0xffFEF9EE),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r))),
                        child: Center(
                          child: SvgPicture.asset('assets/images/wallet.svg'),
                        ),
                      ),
                      15.horizontalSpace,
                      const Text(
                        "Payment Methods",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff563E1F)),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios,
                              size: 20, color: Color(0xff563E1F)))
                    ],
                  ),
                  22.verticalSpace,
                  Row(
                    children: [
                      Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: const Color(0xfff98da0).withOpacity(0.2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r))),
                        child: Center(
                          child:
                              SvgPicture.asset('assets/images/signout-s.svg'),
                        ),
                      ),
                      15.horizontalSpace,
                      Text(
                        AppLocalizations.of(context)!.logout,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffe22648)),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () async {
                            await ref.read(authController.notifier).logout();
                            context.router.replaceAll([const SignInRoute()]);
                          },
                          icon: const Icon(Icons.arrow_forward_ios,
                              size: 20, color: Color(0xff563E1F)))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
