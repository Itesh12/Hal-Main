// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blocked_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BlockedListModelImpl _$$BlockedListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BlockedListModelImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      userProfileImage: json['userProfileImage'] as String?,
      isBlocked: json['isBlocked'] as bool? ?? true,
      username: json['username'] as String,
    );

Map<String, dynamic> _$$BlockedListModelImplToJson(
        _$BlockedListModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'userProfileImage': instance.userProfileImage,
      'isBlocked': instance.isBlocked,
      'username': instance.username,
    };
