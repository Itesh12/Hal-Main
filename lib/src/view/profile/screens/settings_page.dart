import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/view/profile/widgets/settings_tile.dart';

import '../../../app/router/router.gr.dart';
import '../../../l10n/l10n.dart';
// class SettingsPage extends ConsumerWidget {
//   const SettingsPage({Key? key}) : super(key: key);

//   @override
//   // State<SettingsPage> createState() => _SettingsPageState();
// }
bool status = false;

bool sellerMode = false;

@RoutePage()
class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => context.popRoute(),
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
        title: Text(
          AppLocalizations.of(context)!.settings,
          style: TextStyle(
            fontSize: 18.sp,
            color: const Color(0xffE26B26),
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.more_vert),
          // )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: pagePadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SettingTile(
                label: AppLocalizations.of(context)!.language_change,
              ),
              // 10.verticalSpace,
              Flexible(
                child: Row(
                  children: [
                    Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                          color: const Color(0xffFEF9EE),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.r))),
                      child: Center(
                          child: SvgPicture.asset('assets/images/seller.svg')),
                    ),
                    15.horizontalSpace,
                    Text(
                      "Switch To Hal Saathi Mode",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff563E1F)),
                    ),
                    const Spacer(),
                    Consumer(builder: (context, ref, child) {
                      return FlutterSwitch(
                          width: 43.0.w,
                          height: 22.0.h,
                          valueFontSize: 40.0.sp,
                          toggleSize: 22.0.h,
                          value: sellerMode,
                          borderRadius: 18.0,
                          padding: 3.0,
                          activeColor: const Color(0xffE26B26),
                          inactiveColor: const Color(0xffB6B6B6),
                          showOnOff: true,
                          onToggle: (val) async {
                            sellerMode = val;
                            setState(() {});

                            if (sellerMode) {
                              final firstStatus = await ref
                                  .read(droneServiceRepoProvider)
                                  .getSellerFirstStatus();

                              if (firstStatus) {
                                debugPrint("AA GYA true ME");
                                final val = await ref
                                    .read(droneServiceRepoProvider)
                                    .getSellerStatus();
                                switch (val.status) {
                                  case 'Pending':
                                    Navigator.pop(context, true);
                                    context.router.replaceAll(
                                        [const SellerStatusRoute()]);
                                    break;
                                  case 'Rejected':
                                    Navigator.pop(context, true);
                                    context.router.replaceAll(
                                        [const SellerStatusRoute()]);
                                    break;
                                  case 'Active':
                                    Navigator.pop(context, true);
                                    context.router
                                        .replaceAll([const SellerRoute()]);
                                    break;
                                  case 'In-active':
                                    Navigator.pop(context, true);
                                    context.router.replaceAll(
                                        [const SellerInactiveRoute()]);
                                    break;
                                }
                              } else {
                                debugPrint("AA GYA DEBUG ME");
                                Navigator.pop(context, true);
                                context.router.replaceAll(
                                    [const SellerVericationRoute()]);
                              }
                            }
                            setState(() {
                              sellerMode = false;
                            });
                          });
                    })
                  ],
                ),
              ),
              // 26.verticalSpace,
              // Row(
              //   children: [
              //     Container(
              //       height: 40.h,
              //       width: 40.w,
              //       decoration: BoxDecoration(
              //           color: const Color(0xffFEF9EE),
              //           borderRadius: BorderRadius.all(Radius.circular(15.r))),
              //       child: Center(
              //           child: SvgPicture.asset(
              //               'assets/images/notifications_s.svg')),
              //     ),
              //     15.horizontalSpace,
              //     Text(
              //       "Notifications",
              //       style: TextStyle(
              //           fontSize: 16.sp,
              //           fontWeight: FontWeight.w500,
              //           color: const Color(0xff563E1F)),
              //     ),
              //     const Spacer(),
              //     FlutterSwitch(
              //         width: 43.0.w,
              //         height: 22.0.h,
              //         valueFontSize: 40.0.sp,
              //         toggleSize: 22.0.h,
              //         value: status,
              //         borderRadius: 18.0,
              //         padding: 3.0,
              //         activeColor: const Color(0xffE26B26),
              //         inactiveColor: const Color(0xffB6B6B6),
              //         showOnOff: true,
              //         onToggle: (val) {
              //           setState(() {
              //             // context.popRoute();
              //             status = val;
              //           });
              //         })
              //   ],
              // ),
              26.verticalSpace,
              InkWell(
                onTap: () => {print("Secuirty clicked")},
                child: Row(
                  children: [
                    Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                          color: const Color(0xffFEF9EE),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.r))),
                      child: Center(
                        child: SvgPicture.asset('assets/images/secuirty.svg'),
                      ),
                    ),
                    15.horizontalSpace,
                    Text(
                      "Security",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff563E1F)),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              Container(
                  // height: 140.h,
                  width: 340.w,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Color(0xffF9F9F9)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        // SettingOptionTile(
                        //   label: "Account Privacy",
                        //   onTap: () {
                        //     context.router.push(AccountPrivacyRoute());
                        //   },
                        // ),
                        // 18.verticalSpace,
                        SettingOptionTile(
                          label: "Blocked Accounts",
                          onTap: () async {
                            await context.router
                                .push(const UserBlockRoutedList());
                          },
                        ),
                        18.verticalSpace,
                        SettingOptionTile(
                          label: "Privacy policies",
                          onTap: () {
                            context.pushRoute(WebRoute(
                                url: "https://ojasspace.com/privacy-policy",
                                title: "Privacy Policies"));
                          },
                        ),
                        // SizedBox(
                        //   height: 55,
                        //   width: 315,
                        //   child: Card(
                        //     elevation: 2,
                        //     color: Colors.white,
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(11.0),
                        //     ),
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(10.0),
                        //       child: Row(
                        //         // ignore: prefer_const_literals_to_create_immutables
                        //         children: [
                        //           Text(
                        //             "Blocked Accounts",
                        //             style: TextStyle(
                        //                 fontSize: 14.sp,
                        //                 fontWeight: FontWeight.w400,
                        //                 color: Color(0xff563E1F)),
                        //           ),
                        //           const Spacer(),
                        //           InkWell(
                        //             onTap: () => {},
                        //             child: const Icon(
                        //               Icons.arrow_forward_ios,
                        //               size: 18,
                        //             ),
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        // SizedBox(
                        //   height: 55,
                        //   width: 315,
                        //   child: Card(
                        //     elevation: 2,
                        //     color: Colors.white,
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(11.0),
                        //     ),
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(10.0),
                        //       child: Row(
                        //         // ignore: prefer_const_literals_to_create_immutables
                        //         children: [
                        //           Text(
                        //             "Privacy policies",
                        //             style: TextStyle(
                        //                 fontSize: 14.sp,
                        //                 fontWeight: FontWeight.w400,
                        //                 color: const Color(0xff563E1F)),
                        //           ),
                        //           const Spacer(),
                        //           InkWell(
                        //             onTap: () => {},
                        //             child: const Icon(
                        //               Icons.arrow_forward_ios,
                        //               size: 18,
                        //             ),
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  )),
              18.verticalSpace,
              InkWell(
                onTap: () => {},
                child: Row(
                  children: [
                    Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                          color: const Color(0xffFEF9EE),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.r))),
                      child: Center(
                          child: SvgPicture.asset('assets/images/pre_m.svg')),
                    ),
                    15.horizontalSpace,
                    Text(
                      "Help & Support",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff563E1F)),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              Container(
                  // height: 140.h,
                  width: 340.w,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Color(0xffF9F9F9)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        SettingOptionTile(
                          label: "About us",
                          onTap: () {
                            context.pushRoute(WebRoute(
                                url: "https://ojasspace.com/",
                                title: "About"));
                          },
                        ),
                        18.verticalSpace,
                        SettingOptionTile(
                          label: "Help",
                          onTap: () {
                            context.pushRoute(WebRoute(
                                url: "https://ojasspace.com/",
                                title: "Help"));
                          },
                        ),

                        // SizedBox(
                        //   height: 55,
                        //   width: 315,
                        //   child: Card(
                        //     elevation: 2,
                        //     color: Colors.white,
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(11.0),
                        //     ),
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(10.0),
                        //       child: Row(
                        //         // ignore: prefer_const_literals_to_create_immutables
                        //         children: [
                        //           Text(
                        //             "Privacy policies",
                        //             style: TextStyle(
                        //                 fontSize: 14.sp,
                        //                 fontWeight: FontWeight.w400,
                        //                 color: const Color(0xff563E1F)),
                        //           ),
                        //           const Spacer(),
                        //           InkWell(
                        //             onTap: () => {},
                        //             child: const Icon(
                        //               Icons.arrow_forward_ios,
                        //               size: 18,
                        //             ),
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  )),
              10.verticalSpace,
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    TextButton.icon(
                      onPressed: () async {
                        await ref.read(authController.notifier).logout();
                        context.router.replaceAll([const SignInRoute()]);
                      },
                      icon: SvgPicture.asset(
                        "assets/images/signout.svg",
                        // height: 23.w,
                      ),
                      label: Text(
                        AppLocalizations.of(context)!.logout,
                        style: TextStyle(
                          fontSize: 18.sp,
                        ),
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

class SettingOptionTile extends StatelessWidget {
  const SettingOptionTile(
      {super.key, required this.label, required this.onTap});

  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // height: 50.h,
        width: 315.w,
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 18,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              offset: Offset(2.5, 2.5),
              blurRadius: 11,
              color: Color(0xfff4f4f4),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff563E1F)),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
