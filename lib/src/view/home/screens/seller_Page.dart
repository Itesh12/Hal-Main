import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../global_providers.dart';
import '../../../app/router/router.gr.dart';
import '../../../constants/colors.dart';
import '../../../util/services/shared_preferences.dart';
import '../../widget/profile_image.dart';
import '../widget/name_widget.dart';
import '../widget/sellerDetail_widget.dart';

@RoutePage()
class SellerHomePage extends ConsumerWidget {
  const SellerHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _myOrderlistController =
        ref.read(sellerOrderListProvider(UserPreferences.userId));


    return VisibilityDetector(
      onVisibilityChanged: (info) {
        debugPrint("seller visible: ${info.visibleFraction}");
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
      child: RefreshIndicator(
        onRefresh: () => Future.sync(() => [
              _myOrderlistController.refresh(context),
              ref
                  .read(userNotificationListProvider(UserPreferences.userId)
                      .notifier)
                  .refresh(context)
            ]),
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CustomScrollView(
              controller: _myOrderlistController.controller,
              slivers: [
                SliverAppBar(
                  backgroundColor: deepYellow,
                  foregroundColor: white,
                  centerTitle: false,
                  floating: true,
                  actions: [
                    IconButton(
                      onPressed: () {
                        context.router.push(const SellerProfileRoute());
                      },
                      icon: ProfilePicWidget(
                        url: UserPreferences.profilePic,
                        size: 28,
                        fizedSize: true,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 12.0),
                      child: InkWell(
                        onTap: () {
                          context.router.push(const NotificationRoute());
                        },
                        child: SizedBox(
                          child: Stack(
                            children: [
                              SvgPicture.asset(
                                'assets/images/main_n.svg',
                                height: 22,
                                width: 22,
                              ),
                              Consumer(builder: (context, ref, child) {
                                final _mynotificationlistController = ref.watch(
                                    userNotificationListProvider(
                                        UserPreferences.userId));
                                final notificatonCount =
                                    _mynotificationlistController
                                            .orderList?.unreadNotifications ??
                                        0;
                                if (notificatonCount > 0) {
                                  return Positioned(
                                    right: -1,
                                    top: -3,
                                    child: Container(
                                      height: 18,
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
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SliverToBoxAdapter(child: SellerNameWidget()),
                const SliverToBoxAdapter(child: SellerDetail()),
              ],
            ),
            Positioned(
                bottom: 10,
                right: 10,
                child: SizedBox(
                  width: 150.w,
                  child: ElevatedButton(
                      onPressed: () {
                        context.router.push(const MyFarmNetworkRoute());
                      },
                      child: const Center(child: Text("Farm Network", textAlign: TextAlign.center,))),
                ))          ],
        ),
      ),
    );
  }
}
