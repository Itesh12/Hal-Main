import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String userId,
    required String notificationType,
    required String username,
    String? postId,
    String? groupId,
    String? groupName,
    String? profilePicture,
    String? image,
  }) = _NotificationModel;

  const NotificationModel._();

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
