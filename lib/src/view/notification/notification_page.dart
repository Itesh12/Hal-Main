import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';
import 'package:kisaan_station/src/view/notification/screen/socialnotification_page.dart';

import '../../../global_providers.dart';
import '../../constants/colors.dart';

@RoutePage()
class NotificationPage extends ConsumerStatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  ConsumerState<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends ConsumerState<NotificationPage> {
  // List<Widget> tabs() {
  bool loader = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: brown,
            )),
        title: Text(
          "Notification",
          style: TextStyle(
            fontSize: 20.sp,
            color: brown,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          InkWell(
            onTap: () async{
              loader = true;
              setState(() {

              });
              final status = await ref.watch(userNotificationListProvider(UserPreferences.userId)).markAllRead();

              if(status) {
                setState(() => loader = false);
              }
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              width: 120.w,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(20.r)
              ),
              child: loader ? const CupertinoActivityIndicator(color: Colors.white,) : const Text('Mark as all Read',style: TextStyle(color: white, fontWeight: FontWeight.w500,),),
            ),
          )
        ],
        centerTitle: false,
      ),
      body: const SocialNotificationPage(),
      // body: DefaultTabController(
      //   length: 3,
      //   child: NestedScrollView(
      //     headerSliverBuilder: (context, bodyIsScrolled) {
      //       return [
      //     //     SliverAppBar(
      //     //       pinned: true,
      //     //       floating: true,
      //     //       toolbarHeight: 0,
      //     //       expandedHeight: 50.h,
      //     //       bottom: TabBar(
      //     //         labelStyle: TextStyle(
      //     //           color: primary,
      //     //           fontSize: 14.sp,
      //     //           fontWeight: FontWeight.w600,
      //     //         ),
      //     //         unselectedLabelColor: brown,
      //     //         indicator: const UnderlineTabIndicator(
      //     //             borderSide: BorderSide(
      //     //           width: 2,
      //     //           color: primary,
      //     //         )),
      //     //         labelColor: primary,
      //     //         tabs: tabs(),
      //     //       ),
      //     //       // flexibleSpace: const FlexibleSpaceBar(
      //     //       //     background: UserInfo(isOthers: true,), collapseMode: CollapseMode.pin),
      //     //     ),
      //     //   ];
      //     // },
      //     body: const TabBarView(
      //       children: [
      //         SocialNotificationPage(),
      //         SocialNotificationPage(),
      //         Center(
      //           child: Text(
      //             "Selling Products",
      //             style: TextStyle(fontSize: 40),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
