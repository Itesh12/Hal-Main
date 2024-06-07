import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kisaan_station/src/controller/notification_controller.dart';
import 'package:kisaan_station/src/view/home/widget/quick_buttons.dart';
import 'package:kisaan_station/src/view/social/post/widgets/paged_post.dart';
import 'package:new_version_plus/new_version_plus.dart';

import 'package:visibility_detector/visibility_detector.dart';

import '../../../../global_providers.dart';
import '../../../app/router/router.gr.dart';
import '../../../constants/colors.dart';
import '../../../util/services/shared_preferences.dart';
import '../../weather/widgets/weather_tile.dart';
import '../../widget/profile_image.dart';
import '../updatedialog.dart';
import '../widget/name_widget.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // final newVersion = NewVersion(
    //   androidId: 'com.kisaanstation.kisaanstation',
    // );

    final newVersionPlus =
        NewVersionPlus(androidId: 'com.kisaanstation.kisaanstation');

    Timer(const Duration(milliseconds: 800), () {
      checkNewVersion(newVersionPlus);
    });

    super.initState();
  }

  Future<void> checkNewVersion(NewVersionPlus newVersion) async {
    final status = await newVersion.getVersionStatus();

    debugPrint(status?.storeVersion.toString());
    debugPrint(status?.localVersion.toString());

    if (status != null) {
      if (status.canUpdate) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return UpdateDialog(
              allowDismissal: true,
              description: status.releaseNotes,
              version: status.storeVersion,
              appLink: status.appStoreLink,
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final _postListController = ref.read(postListProvider);
    final val = ref.watch(userController(UserPreferences.userId));

    return VisibilityDetector(
      onVisibilityChanged: (info) {
        debugPrint("home visible: ${info.visibleFraction}");
        if (info.visibleFraction == 1.0) {
          SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
            statusBarColor: deepOrange,
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
              _postListController.refresh(context),
              ref
                  .read(userNotificationListProvider(UserPreferences.userId)
                      .notifier)
                  .refresh(context)
            ]),
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        child: CustomScrollView(
          controller: _postListController.controller,
          slivers: [
            SliverAppBar(
              titleSpacing: 1.w,
              backgroundColor: deepOrange,
              foregroundColor: white,
              centerTitle: false,
              floating: true,
              // title: Text(
              //   AppLocalizations.of(context)!.kisaan_station,
              //   style: TextStyle(
              //     fontSize: 20.sp,
              //     color: white,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              title: Padding(
                padding: EdgeInsets.only(bottom: 3.h),
                child: Image.asset(
                  'assets/images/home_screen_logo.png',
                  scale: 1.2,
                ),
              ),
              actions: [
                InkWell(
                  onTap: () async {
                    await context.router.push(NotificationRoute());
                  },
                  child: SizedBox(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0, right: 8),
                          child: SvgPicture.asset(
                            'assets/images/main_n.svg',
                            height: 24,
                            width: 24,
                          ),
                        ),
                        Consumer(builder: (context, ref, child) {
                          final _mynotificationlistController = ref.watch(
                              userNotificationListProvider(
                                  UserPreferences.userId));
                          final notificatonCount = _mynotificationlistController
                                  .orderList?.unreadNotifications ??
                              0;
                          if (notificatonCount > 0) {
                            return Positioned(
                              right: 1,
                              top: 10,
                              child: Container(
                                height: 20,
                                width: 20,
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
                                        fontStyle: FontStyle.italic,
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
                val.when(
                  data: (user) {
                    return IconButton(
                      onPressed: () {
                        context.router.push(const ProfileRoute());
                      },
                      icon: ProfilePicWidget(
                        url: user.profilePic,
                        size: 28,
                        fizedSize: true,
                      ),
                    );
                  },
                  error: (e, __) {
                    return IconButton(
                      onPressed: () {
                        context.router.push(const ProfileRoute());
                      },
                      icon: const ProfilePicWidget(
                        size: 28,
                        fizedSize: true,
                      ),
                    );
                  },
                  loading: () {
                    return IconButton(
                      onPressed: () {
                        context.router.push(const ProfileRoute());
                      },
                      icon: const ProfilePicWidget(
                        size: 28,
                        fizedSize: true,
                      ),
                    );
                  },
                ),
              ],
            ),
            const SliverToBoxAdapter(child: NameWidget()),
            const SliverToBoxAdapter(child: QuickButtonsRow()),
            const SliverToBoxAdapter(child: WeatherTile()),
            // SliverToBoxAdapter(child: SuggestedUserList()),
            const PagedPost(),
          ],
        ),
      ),
    );
  }
}
