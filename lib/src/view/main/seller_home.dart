import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kisaan_station/src/controller/notification_controller.dart';
import 'package:kisaan_station/src/view/widget/sellerBottom_bar.dart';

import '../../../global_providers.dart';
import '../../app/router/router.gr.dart';
import '../../constants/colors.dart';
import '../../l10n/l10n.dart';
import '../../util/services/shared_preferences.dart';

@RoutePage()
class SellerPage extends ConsumerStatefulWidget {
  const SellerPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SellerPageState();
}

class _SellerPageState extends ConsumerState<SellerPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AutoTabsScaffold(
        // drawer: const AppDrawer(),
        appBarBuilder: buildAppBar,
        routes: const [
          SellerHomeRoute(),
          SellerListingRoute(),
          MySellerServicesRoute(),
          SellerOrderRoute(),
          SellerAccountRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return SellerBottomNavigationBar(tabsRouter: tabsRouter);
        },
      ),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context, TabsRouter tabsRouter) {
    final onSellerHome = tabsRouter.activeIndex == 0;
    final onSellerAccount = tabsRouter.activeIndex == 4;
    return tabsRouter.canPop() || onSellerHome
        ? const PreferredSize(preferredSize: Size(0, 0), child: SizedBox())
        : AppBar(
            backgroundColor:
                onSellerHome || onSellerAccount ? deepYellow : Colors.white,
            foregroundColor: onSellerHome || onSellerAccount ? white : brown,
            // ignore: avoid_bool_literals_in_conditional_expressions
            centerTitle: false,

            title: Text(
              buildTitle(tabsRouter.activeIndex, context),
              style: TextStyle(
                fontSize: 22.sp,
                color: onSellerHome || onSellerAccount ? white : primary,
                fontWeight: FontWeight.w700,
              ),
            ),

            actions: buildActions(context, tabsRouter.activeIndex),
          );
  }

  String buildTitle(int index, BuildContext context) {
    switch (index) {
      case 0:
        return AppLocalizations.of(context)!.home;
      case 1:
        return AppLocalizations.of(context)!.my_listing;
      case 2:
        return AppLocalizations.of(context)!.hal_saathi_service;
      case 3:
        return AppLocalizations.of(context)!.order;
      case 4:
        return AppLocalizations.of(context)!.my_account;
      default:
        return AppLocalizations.of(context)!.home;
    }
  }

  List<Widget> buildActions(BuildContext context, int index) {
    final _mynotificationlistController =
        ref.watch(userNotificationListProvider(UserPreferences.userId));
    var notificatonCount;
    if(_mynotificationlistController.orderList != null){
      notificatonCount =
          _mynotificationlistController.orderList!.unreadNotifications;
    }
    else{
      notificatonCount = 0;
    }

    switch (index) {
      case 0:
      // return [const Text("back")];
      case 2:
        return [];
      // return [
      //   IconButton(
      //     onPressed: () async {
      //       await buildShowModalBottomSheet(
      //         context,
      //         (controller) {
      //           return Padding(
      //             padding: pagePadding,
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: <Widget>[
      //                 27.verticalSpace,
      //                 Text(
      //                   'Coming Soon',
      //                   style: TextStyle(
      //                     fontSize: 18.sp,
      //                     fontWeight: FontWeight.w500,
      //                   ),
      //                 ),
      //                 18.verticalSpace,
      //                 Column(
      //                   children: <Widget>[
      //                     InkWell(
      //                       onTap: () {},
      //                       borderRadius: BorderRadius.circular(11),
      //                       child: Container(
      //                         width: 335.w,
      //                         height: 56.h,
      //                         decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.circular(11),
      //                           color: const Color(0xffE8E8E8),
      //                         ),
      //                         child: Row(
      //                           children: <Widget>[
      //                             15.horizontalSpace,
      //                             Image.asset(
      //                               'assets/images/Product.png',
      //                               height: 25.h,
      //                               width: 25.h,
      //                             ),
      //                             13.horizontalSpace,
      //                             Text('Products',
      //                                 style: TextStyle(
      //                                     fontSize: 16.sp,
      //                                     color: const Color(0xff797979))),
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                     9.verticalSpace,
      //                     InkWell(
      //                       onTap: () {
      //                         Navigator.pop(context, true);
      //                         context.router
      //                             .push(const MyStationSellCategories());
      //                       },
      //                       borderRadius: BorderRadius.circular(11),
      //                       child: Container(
      //                         width: 335.w,
      //                         height: 56.h,
      //                         decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.circular(11),
      //                           color: const Color(0xffE8E8E8),
      //                         ),
      //                         child: Row(
      //                           children: <Widget>[
      //                             15.horizontalSpace,
      //                             Image.asset(
      //                               'assets/images/Service.png',
      //                               height: 25.h,
      //                               width: 25.h,
      //                             ),
      //                             14.horizontalSpace,
      //                             Text('Services',
      //                                 style: TextStyle(
      //                                     fontSize: 16.sp,
      //                                     color: const Color(0xff797979))),
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           );
      //         },
      //         initialHeight: 0.30,
      //       );
      //     },
      //     icon: SvgPicture.asset(
      //       "assets/images/sell_icon.svg",
      //     ),
      //     constraints: const BoxConstraints(minWidth: 80),
      //   ),
      // ];
      case 1:
        return [
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 10.0),
            child: IconButton(
                onPressed: () {
                  context.router.push(const UploadDroneSprayFormRoute());
                },
                icon: SvgPicture.asset('assets/images/create_listing.svg')),
          )
          // Padding(
          //     padding: const EdgeInsets.only(right: 10.0),
          //     child: DropdownButton(
          //       underline: const SizedBox.shrink(),
          //       borderRadius: BorderRadius.circular(12),
          //       elevation: 12,
          //       icon: SvgPicture.asset("assets/images/listing_icon.svg"),

          //       // hint: Text(
          //       //   'Monthly',
          //       //   style: TextStyle(
          //       //       color: const Color(0xff563e1f),
          //       //       fontSize: 14.sp,
          //       //       fontWeight: FontWeight.w400),
          //       // ),
          //       // value: _selected,
          //       onChanged: (newValue) async {
          //         setState(() async {
          //           _selected = newValue!;

          //           final val = await ref
          //               .read(droneServiceRepoProvider)
          //               .getSellerStatus();
          //           await ref
          //               .read(stationSellRepoProvider)
          //               .inactiveActiveSeller(
          //                   sellerId: val.id, status: newValue);
          //           successDialog(context,
          //               message: 'you are $newValue now as Seller',
          //               onPressed: () {
          //             Navigator.pop(context);

          //             // Navigator.pop(context);
          //           });
          //         });
          //       },
          //       items: _months.map((months) {
          //         return DropdownMenuItem(
          //           value: months,
          //           child: Padding(
          //             padding: const EdgeInsets.all(10.0),
          //             child: Container(
          //               height: 50,
          //               width: 60,
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(12)),
          //               child: Text(
          //                 months,
          //                 style: const TextStyle(
          //                     color: Color(0xff563e1f),
          //                     fontSize: 14,
          //                     fontWeight: FontWeight.w600),
          //               ),
          //             ),
          //           ),
          //         );
          //       }).toList(),
          //     ))

          // constraints: const BoxConstraints(maxHeight: 34, maxWidth: 34),
          // icon: SvgPicture.asset("assets/images/listing_icon.svg"),
        ];
      // bazaarAction(context);
      case 3:
        return [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () {
                // context.router.push(const NotificationRoute());
              },
              constraints: const BoxConstraints(maxHeight: 34, maxWidth: 34),
              icon: const Icon(Icons.search_outlined),
            ),
          ),
        ];

      case 4:
        return [
          Padding(
            padding: const EdgeInsets.only(top: 12, right: 10.0),
            child: InkWell(
              onTap: () {
                context.router.push(const NotificationRoute());
              },
              child: SizedBox(
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/images/main_n.svg',
                      height: 24,
                      width: 24,
                    ),
                    if (notificatonCount! > 0)
                      Positioned(
                        right: -1,
                        top: -3,
                        child: Container(
                          height: 20,
                          width: 18,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.deepOrange,
                          ),
                          child: Center(
                            child: Text(
                              notificatonCount.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
        ];
      default:
        return [];
    }
  }

  // List<Widget> homeAction(BuildContext context) {
  //   return [
  //     IconButton(
  //       onPressed: () {
  //         context.router.push(const NotificationRoute());
  //       },
  //       constraints: const BoxConstraints(maxHeight: 34, maxWidth: 34),
  //       icon: SvgPicture.asset("assets/images/notification.svg"),
  //     ),
  //     IconButton(
  //       onPressed: () {},
  //       constraints: const BoxConstraints(maxHeight: 38, maxWidth: 38),
  //       icon: SvgPicture.asset("assets/images/chat.svg"),
  //     ),
  //     IconButton(
  //       onPressed: () {
  //         context.router.push(const ProfileRoute());
  //       },
  //       icon: ProfilePicWidget(
  //         url: UserPreferences.profilePic,
  //         size: 28,
  //         fizedSize: true,
  //       ),
  //     ),
  //   ];
  // }

  // List<Widget> bazaarAction(BuildContext context) {
  //   return [
  //     IconButton(
  //       onPressed: () {},
  //       icon: SvgPicture.asset("assets/images/bazaar_plus.svg"),
  //     ),
  //     IconButton(
  //       onPressed: () {},
  //       icon: SvgPicture.asset("assets/images/bazaar_path.svg"),
  //     ),
  //   ];
  // }
}
