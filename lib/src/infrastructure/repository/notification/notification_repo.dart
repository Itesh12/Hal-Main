import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../model/notification/new_notification_model.dart';
import '../../../util/services/shared_preferences.dart';
import '../../http/api_provider.dart';

class NotificationDataRepository {
  NotificationDataRepository(this.ref);

  final Ref ref;

  final stalkerId = UserPreferences.userId;

  Future<NotificationModel?> getNotificationData({
    required int page,
    required int size,
  }) async {
    NotificationModel? notificationData;

    final res = await ref.read(apiProvider).get(
        '/notification/user-notification-list/',
        query: {"userId": stalkerId , "page": page, "size": size});

    res.when(
     success: (value) {


    notificationData = NotificationModel.fromJson(value);
    debugPrint('worked ${notificationData!.list.length}');

    debugPrint(value.toString());
  },
      error: (error) {
        throw error;
      },
    );
    return notificationData;
  }

  Future<void> viewnotificationStatus({
    required String userId,
    required String notificationId,
  }) async {
    final res = await ref
        .read(apiProvider)
        .put('/notification/view-notification/', body: {
      "userId": userId,
      "notificationId":  notificationId,
    });
    res.when(
      success: (source) {
        debugPrint(source["message"]);
      },
      error: (error) {
        throw error;
      },
    );
  }

  Future<bool> markAsAllRead({
    required String userId,
  }) async {
    bool status = false;
    final res = await ref
        .read(apiProvider)
        .post('/post/mark-as-all-read/$userId');
    res.when(
      success: (source) {
       status = source['success'];
      },
      error: (error) {
        throw error;
      },
    );
    return status;
  }
}
