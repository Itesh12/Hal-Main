import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/view/notification/widgets/social_notification_tile.dart';

import '../../../util/services/shared_preferences.dart';
import '../../widget/no_item_widget.dart';

class SocialNotificationPage extends ConsumerStatefulWidget {
  const SocialNotificationPage({Key? key}) : super(key: key);
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  _SocialNotificationPageState createState() => _SocialNotificationPageState();
}

class _SocialNotificationPageState
    extends ConsumerState<SocialNotificationPage> {
  String userId = UserPreferences.userId;
  @override
  Widget build(BuildContext context) {
    final notificationListController =
        ref.watch(userNotificationListProvider(userId));
    final listings = notificationListController.orderList;


    return listings == null
        ? const Center(child: Text("No Notification found"))
        : listings.list.isEmpty
            ? const SizedBox(
                child: NoorderWidget(
                  icon: "notifications_s",
                  title: "No Notification Yet",
                  subTitle: "You have not received any notification yet.",
                ),
              )
            : notificationListController.isFirstError
                ? Container(
                    padding: const EdgeInsets.only(top: 30, bottom: 40),
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            child: Text(
                              notificationListController.firstErrorMessage,
                              style: const TextStyle(color: redError),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (notificationListController
                                      .firstErrorMessage !=
                                  "Session Expired...") {
                                notificationListController.refresh(context);
                              } else {}
                            },
                            child: Text(
                                notificationListController.firstErrorMessage ==
                                        "Session Expired..."
                                    ? "SignIn Again"
                                    : "Retry"),
                          )
                        ],
                      ),
                    ),
                  )
                : listings.list.isNotEmpty
                    ? ListView.builder(
                        controller: notificationListController.controller,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if (index == listings.list.length) {
                            if (notificationListController.isLoadMoreRunning) {
                              return const Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 40),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else if (notificationListController
                                .isLoadMoreError) {
                              return Container(
                                padding:
                                    const EdgeInsets.only(top: 30, bottom: 40),
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    notificationListController
                                        .loadMoreErrorMessage,
                                    style: const TextStyle(color: redError),
                                  ),
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          } else {
                            if (notificationListController.isLoadMoreRunning && index == listings.list.length-1) {
                              return const Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 40),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: SocialNotificationTile(
                                    userNotifications: listings.list[index]),
                              );
                            }
                          }
                        },
                        itemCount: listings.list.length,
                      )
                    : const SizedBox(
                        height: 400,
                        child: NoorderWidget(
                          icon: "task-1",
                          title: "No Orders Yet",
                          subTitle: "You have not received any order yet.",
                        ),
                      );
  }
}
