// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostAdapter extends TypeAdapter<Post> {
  @override
  final int typeId = 0;

  @override
  Post read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Post(
      postId: fields[0] as String,
      userId: fields[1] as String,
      postType: fields[2] as String,
      userProfileImage: fields[3] as String?,
      link: fields[4] as String?,
      name: fields[5] as String,
      postDescription: fields[6] as String,
      media: (fields[7] as List).cast<Media>(),
      createdAt: fields[8] as DateTime,
      totalLikes: fields[9] as int,
      latitude: fields[10] as double,
      longitude: fields[11] as double,
      likeDislike: fields[12] as bool,
      commentCount: fields[13] as int,
      reportCount: fields[14] as int,
      followingStatus: fields[15] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Post obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.postId)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.postType)
      ..writeByte(3)
      ..write(obj.userProfileImage)
      ..writeByte(4)
      ..write(obj.link)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.postDescription)
      ..writeByte(7)
      ..write(obj.media)
      ..writeByte(8)
      ..write(obj.createdAt)
      ..writeByte(9)
      ..write(obj.totalLikes)
      ..writeByte(10)
      ..write(obj.latitude)
      ..writeByte(11)
      ..write(obj.longitude)
      ..writeByte(12)
      ..write(obj.likeDislike)
      ..writeByte(13)
      ..write(obj.commentCount)
      ..writeByte(14)
      ..write(obj.reportCount)
      ..writeByte(15)
      ..write(obj.followingStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      postId: json['postId'] as String,
      userId: json['userId'] as String,
      postType: json['postType'] as String,
      userProfileImage: json['userProfileImage'] as String?,
      link: json['link'] as String?,
      name: json['name'] as String,
      postDescription: json['postDescription'] as String,
      media: (json['media'] as List<dynamic>)
          .map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      totalLikes: json['totalLikes'] as int,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      likeDislike: json['like_dislike'] as bool,
      commentCount: json['comment_count'] as int,
      reportCount: json['report_count'] as int,
      followingStatus: json['following_status'] as bool,
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'userId': instance.userId,
      'postType': instance.postType,
      'userProfileImage': instance.userProfileImage,
      'link': instance.link,
      'name': instance.name,
      'postDescription': instance.postDescription,
      'media': instance.media,
      'createdAt': instance.createdAt.toIso8601String(),
      'totalLikes': instance.totalLikes,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'like_dislike': instance.likeDislike,
      'comment_count': instance.commentCount,
      'report_count': instance.reportCount,
      'following_status': instance.followingStatus,
    };
