import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/model/notification/new_notification_model.dart';
import 'package:readmore/readmore.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

import '../../../app/router/router.gr.dart';
import '../../../util/services/shared_preferences.dart';

class SocialNotificationTile extends ConsumerStatefulWidget {
  const SocialNotificationTile({required this.userNotifications});

  final NotificationItem userNotifications;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SocialNotificationTileState();
}

class _SocialNotificationTileState
    extends ConsumerState<SocialNotificationTile> {
  final Color _containerColor = const Color(0xffFFF8e8);
  final Color _containerColor1 = const Color(0xffdfdfdf).withOpacity(0.1);

  


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


      final _mynotification =
          ref.watch(userNotificationListProvider(UserPreferences.userId));

  final String timeAgo = timeago.format(widget.userNotifications.data!.eventTime!);
 



      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 5.verticalSpace,

          InkWell(
              onTap: () async {
                await ref.read(notificationDataRepoProvider).viewnotificationStatus(userId: UserPreferences.userId, notificationId: widget.userNotifications.sId!);

                switch (widget.userNotifications.data!.route) {
                  case 'post':
                    final String post = widget.userNotifications.data!.post!;
                    debugPrint("going to post route");

                    context.router.push(PostDetailRoute(postId: post));
                    break;
                  case 'follow':
                    debugPrint("going to follow route");
                    context.router.push(UserFollowersRoute(
                        fromFollowers: true,
                        isOthers: false,
                        otherUserId: UserPreferences.userId));
                    break;
                  case 'news':
                    debugPrint("going to news route");
                    context.router.push(const NewsRoute());
                    break;

                  case 'comment':
               final String post = widget.userNotifications.data!.post!;
                    debugPrint("going to comment route");
                    context.router.push(CommentRoute(postId: post));
                    break;
                  case 'reply':
                    debugPrint("going to reply route");
               final String post = widget.userNotifications.data!.post!;

                    context.router.push(CommentRoute(postId: post));

                    break;
                  case 'farmReport':
                    debugPrint("going to farmReport route");
                    await launchUrl(Uri.parse(widget.userNotifications.data!.pdf!));

                    break;
                  case 'like':
               final String post = widget.userNotifications.data!.post!;

                    debugPrint("going to like route");
                    context.router.push(PostDetailRoute(postId: post));
                    break;
                  case 'product_approved':
                    debugPrint("going to product route");
                    context.router.push(const MyProductListDrawerRoute());
                    break;
                  case 'product_rejected':
                    debugPrint("going to product route");
                    context.router.push(const MyProductListDrawerRoute());
                    break;
                  case 'order_placed':
                    debugPrint("going to order placed route");
                    context.router.push(const MyOrderRoute());
                    break;
                  case 'order_cancelled_buyer':
                    debugPrint("going to order cancel buyer route");
                    context.router.push(const MyOrderRoute());
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

                    
                      context.router.push(
                          const SellerRoute(children: [SellerOrderRoute()]));
                  
                     
                    break;
                  case 'payment_pending_seller':
                    debugPrint("going to paymeny pendindg seller route");
                    context.router
                        .push(const SellerRoute(children: [SellerOrderRoute()]));

                    break;
                  case 'payment_delivered_seller':
                    debugPrint(
                        "going to order deliverred payment recieved route");
                    context.router
                        .push(const SellerRoute(children: [SellerOrderRoute()]));

                    break;
                  case 'order_cancelled_seller':
                    debugPrint("going to order cancel seller route");
                    context.router
                        .push(const SellerRoute(children: [SellerOrderRoute()]));
                    break;

                  case 'order_delivered_seller':
                    debugPrint("going to order cancel seller route");
                    context.router
                        .push(const SellerRoute(children: [SellerOrderRoute()]));
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

                _mynotification.refresh(context);

                ref.refresh(userNotificationListProvider(UserPreferences.userId));
              },
              child: widget.userNotifications.notification!.body
                      .toString()!="null"
                      
                  ? SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 15.h,
                          bottom: 15.h,
                        ),
                        color: widget.userNotifications.view == true ? _containerColor1:_containerColor,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              if(widget.userNotifications.data!.userImage == "" || widget.userNotifications.data!.userImage == "null" || widget.userNotifications.data!.userImage == null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 6.0),
                                  child: SizedBox(
                                    height: 45.h,
                                    width: 45.w,
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        backgroundImage: Image.asset(
                                          'assets/images/app_icon.png',
                                          fit: BoxFit.cover,
                                        ).image),
                                  ),
                                )
                              else
                                SizedBox(
                                  height: 40.h,
                                  width: 40.w,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(widget.userNotifications.data!.userImage.toString())
                                  ),
                                ),
                              12.horizontalSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *0.7,
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                              text: widget.userNotifications.notification!.title
                                                  .toString(),
                                               style: const TextStyle(
                                                color: primary,
                                              )),
                                        ],
                                      ),
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *0.7,
                                    child: ReadMoreText(
                                      widget.userNotifications.notification!.body.toString(),
                                        style: TextStyle(
                                          color: const Color(0xff414141),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp,
                                        ),
                                      trimLines: 3,
                                      trimLength:100,

                                    ),
                                  ),
                                  // Flexible(
                                  //   child: Text(
                                  //       widget.userNotifications.notification.body
                                  //           .toString(),

                                  // ),
                                  Text(timeAgo,
                                      style: TextStyle(
                                        color: const Color(0xff817e78),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.only(
                        top: 15.h,
                        bottom: 15.h,
                      ),
                      color: widget.userNotifications.view == true ? _containerColor1:_containerColor,
                      height: 85.h,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            if(widget.userNotifications.data!.userImage == "" || widget.userNotifications.data!.userImage == "null" || widget.userNotifications.data!.userImage == null)
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: SizedBox(
                                  height: 45.h,
                                  width: 45.w,
                                  child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      backgroundImage: Image.asset(
                                        'assets/images/app_icon.png',
                                        fit: BoxFit.cover,
                                      ).image),
                                ),
                              )
                            else
                              SizedBox(
                                height: 40.h,
                                width: 40.w,
                                child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(widget.userNotifications.data!.userImage.toString())
                                ),
                              ),
                            12.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                              text: widget.userNotifications.notification!.title
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: primary)),
                                        ],
                                      ),
                                    ),
                                    // 10.horizontalSpace,
                                    // const Icon(
                                    //   Icons.more_horiz,
                                    //   color: Color(0xffC4C4C4),
                                    // )
                                  ],
                                ),
                                Text(timeAgo),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ))
                    ]
                    );
        
      
  }
}
