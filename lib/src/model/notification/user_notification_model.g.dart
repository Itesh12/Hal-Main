// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserNotificationModelImpl _$$UserNotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserNotificationModelImpl(
      list: (json['list'] as List<dynamic>)
          .map((e) => ListElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      unreadNotifications: json['unreadNotifications'] as int,
    );

Map<String, dynamic> _$$UserNotificationModelImplToJson(
        _$UserNotificationModelImpl instance) =>
    <String, dynamic>{
      'list': instance.list,
      'unreadNotifications': instance.unreadNotifications,
    };

_$ListElementImpl _$$ListElementImplFromJson(Map<String, dynamic> json) =>
    _$ListElementImpl(
      notification:
          Notification.fromJson(json['notification'] as Map<String, dynamic>),
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      id: json['_id'] as String,
      view: json['view'] as bool,
    );

Map<String, dynamic> _$$ListElementImplToJson(_$ListElementImpl instance) =>
    <String, dynamic>{
      'notification': instance.notification,
      'data': instance.data,
      '_id': instance.id,
      'view': instance.view,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      post: json['post'] as String?,
      route: json['route'] as String?,
      image: json['image'] as String?,
      userImage: json['userImage'] as String?,
      event_time: json['event_time'] == null
          ? null
          : DateTime.parse(json['event_time'] as String),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'post': instance.post,
      'route': instance.route,
      'image': instance.image,
      'userImage': instance.userImage,
      'event_time': instance.event_time?.toIso8601String(),
    };

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      title: json['title'] as String?,
      body: json['body'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'image': instance.image,
    };
