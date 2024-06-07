// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../user/media_model.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
@HiveType(typeId: 0)
abstract class Post with _$Post {
  const factory Post({
    @HiveField(0)
    required String postId,
    @HiveField(1)
    required String userId,
    @HiveField(2)
    required String postType,
    @HiveField(3)
    String? userProfileImage,
    @HiveField(4)
    String? link,
    @HiveField(5)
    required String name,
    @HiveField(6)
    required String postDescription,
    @HiveField(7)
    required List<Media> media,
    @HiveField(8)
    required DateTime createdAt,
    @HiveField(9)
    required int totalLikes,
    @HiveField(10)
    required double latitude,
    @HiveField(11)
    required double longitude,
    @JsonKey(name: "like_dislike")
    @HiveField(12)
    required bool likeDislike,
    @JsonKey(name: "comment_count") @HiveField(13) required int commentCount,
    @JsonKey(name: "report_count") @HiveField(14) required int reportCount,
    @JsonKey(name: "following_status") @HiveField(15) required bool followingStatus,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
