// To parse this JSON data, do
//
//     final reelModel = reelModelFromJson(jsonString);

import 'dart:convert';

List<ReelModel> reelModelFromJson(String str) =>
    List<ReelModel>.from(json.decode(str).map((x) => ReelModel.fromJson(x)));

String reelModelToJson(List<ReelModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReelModel {
  final String title;
  final String video;
  final int likes;
  final int userId;
  final List<Comment> comments;

  ReelModel({
    this.title = '',
    this.video = '',
    this.likes = 0,
    this.userId = 0,
    required this.comments,
  });

  factory ReelModel.fromJson(Map<String, dynamic> json) => ReelModel(
        title: json["title"] ?? '',
        video: json["video"] ?? '',
        likes: json["likes"] ?? 0,
        userId: json["userId"] ?? 0,
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "video": video,
        "likes": likes,
        "userId": userId,
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
      };
}

class Comment {
  final int userId;
  final String text;

  Comment({
    this.userId = 0,
    this.text = '',
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        userId: json["userId"] ?? 0,
        text: json["text"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "text": text,
      };
}
