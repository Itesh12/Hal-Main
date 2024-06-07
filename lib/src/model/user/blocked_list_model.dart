// To parse this JSON data, do
//
//     final blockedListModel = blockedListModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'blocked_list_model.freezed.dart';
part 'blocked_list_model.g.dart';

List<BlockedListModel> blockedListModelFromJson(String str) =>
    List<BlockedListModel>.from(
        json.decode(str).map((x) => BlockedListModel.fromJson(x)));

String blockedListModelToJson(List<BlockedListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class BlockedListModel with _$BlockedListModel {
  const factory BlockedListModel({
    @JsonKey(name: "_id") required String id,
    required String name,
    String? userProfileImage,
    @Default(true) bool isBlocked,
    required String username,
  }) = _BlockedListModel;

  factory BlockedListModel.fromJson(Map<String, dynamic> json) =>
      _$BlockedListModelFromJson(json);
}
