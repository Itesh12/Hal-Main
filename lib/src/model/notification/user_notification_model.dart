// To parse this JSON data, do
//
//     final userNotificationModel = userNotificationModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_notification_model.freezed.dart';
part 'user_notification_model.g.dart';

UserNotificationModel userNotificationModelFromJson(String str) => UserNotificationModel.fromJson(json.decode(str));

String userNotificationModelToJson(UserNotificationModel data) => json.encode(data.toJson());

@freezed
class UserNotificationModel with _$UserNotificationModel {
    const factory UserNotificationModel({
        required List<ListElement> list,
        required int unreadNotifications,
    }) = _UserNotificationModel;

    factory UserNotificationModel.fromJson(Map<String, dynamic> json) => _$UserNotificationModelFromJson(json);
}

@freezed
class ListElement with _$ListElement {
    const factory ListElement({
        required Notification notification,
        required Data data,
        @JsonKey(name: "_id") required String id,
        required bool view,
    }) = _ListElement;

    factory ListElement.fromJson(Map<String, dynamic> json) => _$ListElementFromJson(json);
}

@freezed
class Data with _$Data {
    const factory Data({
        required String? post,
        required String? route,
        required String? image,
        required String? userImage,
        required DateTime? event_time,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Notification with _$Notification {
    const factory Notification({
        required String? title,
        required String? body,
        required String? image,
    }) = _Notification;

    factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
}
