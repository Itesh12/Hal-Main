// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopNewsModelImpl _$$TopNewsModelImplFromJson(Map<String, dynamic> json) =>
    _$TopNewsModelImpl(
      id: json['_id'] as String,
      title: json['title'] as String?,
      image: (json['image'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      viewCount: json['viewCount'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$TopNewsModelImplToJson(_$TopNewsModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'description': instance.description,
      'viewCount': instance.viewCount,
      'createdAt': instance.createdAt.toIso8601String(),
      'status': instance.status,
    };

_$ImageImpl _$$ImageImplFromJson(Map<String, dynamic> json) => _$ImageImpl(
      mediaUrl: json['mediaUrl'] as String,
      mediaType: json['mediaType'] as String,
    );

Map<String, dynamic> _$$ImageImplToJson(_$ImageImpl instance) =>
    <String, dynamic>{
      'mediaUrl': instance.mediaUrl,
      'mediaType': instance.mediaType,
    };
