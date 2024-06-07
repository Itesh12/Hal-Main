import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/l10n/l10n.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';
import 'package:kisaan_station/src/view/widget/bottom_navigation.dart';
import 'package:kisaan_station/src/view/widget/drawer.dart';
import 'package:kisaan_station/src/view/widget/profile_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../notificationservices/local_notifications_service.dart';
import '../../model/user/user_model.dart';

@RoutePage()
class KisaanHomePage extends ConsumerStatefulWidget {
  const KisaanHomePage({Key? key}) : super(key: key);

  @override
  _KisaanHomePageState createState() => _KisaanHomePageState();
}

class _KisaanHomePageState extends ConsumerState<KisaanHomePage> {
  void _handleNotificationInteraction(Map<String, dynamic> messageData) {
    switch (messageData['route']) {
      case 'post':
        final String post = messageData['post'];
        debugPrint("going to post route");
        debugPrint(messageData['post']);
        context.router.push(PostDetailRoute(postId: post));
        break;
      case 'follow':
        debugPrint("going to follow route");
        context.router.push(UserFollowersRoute(
            fromFollowers: true,
            isOthers: false,
            otherUserId: UserPreferences.userId));
        break;

      case 'comment':
        final String post = messageData['post'];
        debugPrint("going to comment route");
        context.router.push(CommentRoute(postId: post));
        break;
      case 'reply':
        debugPrint("going to reply route");
        final String post = messageData['post'];
        context.router.push(CommentRoute(postId: post));

        break;
      case 'farmReport':
        debugPrint("going to farmReport route");
        context.router.replaceAll([CropReportRoute(crop: messageData['crop'])]);
        break;
      case 'like':
        final String post = messageData['post'];
        debugPrint("going to like route");
        context.router.push(PostDetailRoute(postId: post));
        break;

      case 'news':
        debugPrint("going to news route");
        context.router.push(const NewsRoute());
        break;

      case 'order_placed':
        debugPrint("going to order placed route");
        context.router.push(const MyOrderRoute());
        break;
      case 'order_cancelled_buyer':
        debugPrint("going to order cancel buyer route");
        context.router.push(const MyOrderRoute());
        break;
      case 'product_approved':
        debugPrint("going to product route");
        context.router.push(const MyProductListDrawerRoute());
        break;
      case 'product_rejected':
        debugPrint("going to product route");
        context.router.push(const MyProductListDrawerRoute());
        break;

      case 'order_delivered_buyer':
        debugPrint("going to order deliver buyer route");
        context.router.push(const MyOrderRoute());
        break;

      case 'payment_pending_buyer':
        debugPrint("going to order payment pending buyer route");
        context.router.push(const MyOrderRoute());
        break;
      case 'payment_completed_buyer':
        debugPrint("going to order payment completed buyer route");
        context.router.push(const MyOrderRoute());
        break;
      case 'order_recieved':
        debugPrint("going to order recieved route");
        context.router.push(const SellerRoute(children: [SellerOrderRoute()]));
        break;
      case 'payment_pending_seller':
        debugPrint("going to paymeny pendindg seller route");
        context.router.push(const SellerRoute(children: [SellerOrderRoute()]));

        break;
      case 'payment_delivered_seller':
        debugPrint("going to order deliverred payment recieved route");
        context.router.push(const SellerRoute(children: [SellerOrderRoute()]));

        break;
      case 'order_cancelled_seller':
        debugPrint("going to order cancel seller route");
        context.router.push(const SellerRoute(children: [SellerOrderRoute()]));
        break;

      case 'order_delivered_seller':
        debugPrint("going to order cancel seller route");
        context.router.push(const SellerRoute(children: [SellerOrderRoute()]));
        break;
      case 'seller_inactive':
        debugPrint("going to seller status  route");
        context.router.push(const SellerStatusRoute());
        break;

      case 'seller_active':
        debugPrint("going to seller status  route");
        context.router.push(const SellerStatusRoute());
        break;

      case 'seller_rejected':
        debugPrint("going to seller status  route");
        context.router.push(const SellerStatusRoute());
        break;
    }
  }

  void mystream() {
    LocalNotificationService.streamController.stream.listen((decodedMap) {
      _handleNotificationInteraction(decodedMap);
    });
  }

  Future<void> setupInteractedMessage() async {
    // 1. This method only call if the application is opened from a terminated state
    final RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleNotificationInteraction(initialMessage.data);
    }

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        debugPrint("FirebaseMessaging.onMessage.listen in running mode");
        if (message.notification != null) {
          debugPrint(message.notification!.title);
          debugPrint(message.notification!.body);
          debugPrint("message.data11 ${message.data}");
          if (message.data['image'].toString().isNotEmpty) {
            LocalNotificationService.createanddisplaynotification(message);
          } else {
            LocalNotificationService.createanddisplaynotificationwithoutimage(
                message);
          }
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      debugPrint(
          "FirebaseMessaging.onMessageOpenedApp.listen in background mode");
      debugPrint(message.data.toString());
      if (message.notification != null) {
        debugPrint(message.notification!.title);
        debugPrint(message.notification!.body);
        debugPrint(message.toString());

        _handleNotificationInteraction(message.data);
      }
    });

    // 4. sets stream for Navigating to Desired Screen on Tap on Notification while App is in foreground
    mystream();
  }

  @override
  void initState() {
    super.initState();
    setupInteractedMessage();

    // ref.read(dynamicLinkProvider).retrieveDynamicLink(context);
  }

  bool floatingButtonColor = false;

  final Uri _url = Uri.parse(
      'https://play.google.com/store/apps/details?id=com.hal.suvidha');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(userController(UserPreferences.userId),
        (AsyncValue<User>? previous, AsyncValue<User> next) {
      next.whenData((user) async {
        if (UserPreferences.profilePic != user.profilePic) {
          if (user.profilePic != null) {
            await UserPreferences.setProfilePic(user.profilePic!);
          } else {
            await UserPreferences.removeProfile();
          }
        }
        if (UserPreferences.userName != user.name) {
          await UserPreferences.setUserName(user.name);
        }
        setState(() {});
      });
    });
    return SafeArea(
      child: AutoTabsScaffold(
        drawer: const AppDrawer(),
        appBarBuilder: buildAppBar,
        routes: const [
          HomeRoute(),
          StationRoute(),
          BazarRoute(),
          FarmListRoute(),
          GyanRoute()
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return KBottomNavigationBar(tabsRouter: tabsRouter);
        },
        floatingActionButton: SizedBox(
          height: 45.w,
          width: 45.w,
          child: FloatingActionButton(
            backgroundColor:
                floatingButtonColor ? Colors.green[700] : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {
              setState(() {
                floatingButtonColor = true;
              });
              _launchUrl().then((value) {
                setState(() {
                  floatingButtonColor = false;
                });
              });
            },
            child: Image.asset(
              "assets/images/suvidhaIcon.png",
              height: 30.w,
              color: floatingButtonColor ? Colors.white : null,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context, TabsRouter tabsRouter) {
    final onHome = tabsRouter.activeIndex == 0;
    return tabsRouter.canPop() || onHome
        ? const PreferredSize(preferredSize: Size(0, 0), child: SizedBox())
        : AppBar(
            backgroundColor: onHome ? deepOrange : Colors.white,
            foregroundColor: onHome ? white : brown,
            // ignore: avoid_bool_literals_in_conditional_expressions
            centerTitle: onHome ? false : true,
            title: Text(
              buildTitle(tabsRouter.activeIndex, context),
              style: TextStyle(
                fontSize: 20.sp,
                color: onHome ? white : primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: buildActions(context, tabsRouter.activeIndex),
          );
  }

  String buildTitle(int index, BuildContext context) {
    switch (index) {
      case 0:
        return AppLocalizations.of(context)!.district_center;
      case 1:
        return AppLocalizations.of(context)!.my_center;
      case 2:
        return AppLocalizations.of(context)!.krishi_bazar;
      case 3:
        return AppLocalizations.of(context)!.my_farm;
      case 4:
        return AppLocalizations.of(context)!.krishi_gyan;
      default:
        return AppLocalizations.of(context)!.district_center;
    }
  }

  List<Widget> buildActions(BuildContext context, int index) {
    switch (index) {
      case 0:
        return [];
      // homeAction(context);
      case 1:
        return [
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
          //                   'What are you selling?',
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
        ];
      case 2:
        return [];
      // bazaarAction(context);
      case 3:
        return [];
      case 4:
        return [];
      default:
        return [];
    }
  }

  List<Widget> homeAction(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          context.router.push(const NotificationRoute());
        },
        constraints: const BoxConstraints(maxHeight: 34, maxWidth: 34),
        icon: SvgPicture.asset("assets/images/notification.svg"),
      ),
      IconButton(
        onPressed: () {},
        constraints: const BoxConstraints(maxHeight: 38, maxWidth: 38),
        icon: SvgPicture.asset("assets/images/chat.svg"),
      ),
      IconButton(
        onPressed: () {
          context.router.push(const ProfileRoute());
        },
        icon: ProfilePicWidget(
          url: UserPreferences.profilePic,
          size: 28,
          fizedSize: true,
        ),
      ),
    ];
  }

  List<Widget> bazaarAction(BuildContext context) {
    return [
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset("assets/images/bazaar_plus.svg"),
      ),
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset("assets/images/bazaar_path.svg"),
      ),
    ];
  }
}
