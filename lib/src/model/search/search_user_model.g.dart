// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchUserModelImpl _$$SearchUserModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchUserModelImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      userProfileImage: json['userProfileImage'] as String?,
    );

Map<String, dynamic> _$$SearchUserModelImplToJson(
        _$SearchUserModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'userProfileImage': instance.userProfileImage,
    };
