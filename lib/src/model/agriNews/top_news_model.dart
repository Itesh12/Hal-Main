import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_news_model.freezed.dart';
part 'top_news_model.g.dart';

List<TopNewsModel> topNewsModelFromJson(String str) => List<TopNewsModel>.from(json.decode(str).map((x) => TopNewsModel.fromJson(x)));

String topNewsModelToJson(List<TopNewsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class TopNewsModel with _$TopNewsModel {
  const factory TopNewsModel({
       @JsonKey(name: "_id") required String id,
     String? title,
     List<Image>? image,
     String? description,
    required int viewCount,
    required DateTime createdAt,
    required String status,
  }) = _TopNewsModel;

  factory TopNewsModel.fromJson(Map<String, dynamic> json) => _$TopNewsModelFromJson(json);
}

@freezed
abstract class Image with _$Image {
  const factory Image({
    required String mediaUrl,
    required String mediaType,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
