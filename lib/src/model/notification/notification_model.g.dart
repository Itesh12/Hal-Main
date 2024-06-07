// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      userId: json['userId'] as String,
      notificationType: json['notificationType'] as String,
      username: json['username'] as String,
      postId: json['postId'] as String?,
      groupId: json['groupId'] as String?,
      groupName: json['groupName'] as String?,
      profilePicture: json['profilePicture'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'notificationType': instance.notificationType,
      'username': instance.username,
      'postId': instance.postId,
      'groupId': instance.groupId,
      'groupName': instance.groupName,
      'profilePicture': instance.profilePicture,
      'image': instance.image,
    };
