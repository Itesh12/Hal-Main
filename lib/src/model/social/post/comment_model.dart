// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

List<Comment> commentFromJson(String str) =>
    List<Comment>.from(json.decode(str).map((x) => Comment.fromJson(x)));

String commentToJson(List<Comment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class Comment with _$Comment {
  const factory Comment({
    @JsonKey(name: "_id") required String id,
    required String entityId,
    required String userId,
    required String name,
    String? userProfileImage,
    String? message,
    String? image,
    String? mimetype,
    @JsonKey(name: "replies_count") required int repliesCount,
    required DateTime createdAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
