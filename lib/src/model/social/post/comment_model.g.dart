// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      id: json['_id'] as String,
      entityId: json['entityId'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      userProfileImage: json['userProfileImage'] as String?,
      message: json['message'] as String?,
      image: json['image'] as String?,
      mimetype: json['mimetype'] as String?,
      repliesCount: json['replies_count'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'entityId': instance.entityId,
      'userId': instance.userId,
      'name': instance.name,
      'userProfileImage': instance.userProfileImage,
      'message': instance.message,
      'image': instance.image,
      'mimetype': instance.mimetype,
      'replies_count': instance.repliesCount,
      'createdAt': instance.createdAt.toIso8601String(),
    };
