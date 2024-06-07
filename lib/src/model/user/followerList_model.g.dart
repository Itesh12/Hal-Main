// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'followerList_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowerListModelImpl _$$FollowerListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowerListModelImpl(
      followingId: json['follower_id'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      followingStatus: json['following_status'] as bool,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$FollowerListModelImplToJson(
        _$FollowerListModelImpl instance) =>
    <String, dynamic>{
      'follower_id': instance.followingId,
      'name': instance.name,
      'username': instance.username,
      'following_status': instance.followingStatus,
      'image': instance.image,
    };

_$FollowingListModelImpl _$$FollowingListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowingListModelImpl(
      followingId: json['following_id'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      followingStatus: json['following_status'] as bool,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$FollowingListModelImplToJson(
        _$FollowingListModelImpl instance) =>
    <String, dynamic>{
      'following_id': instance.followingId,
      'name': instance.name,
      'username': instance.username,
      'following_status': instance.followingStatus,
      'image': instance.image,
    };
