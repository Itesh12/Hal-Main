import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_user_model.freezed.dart';
part 'search_user_model.g.dart';

List<SearchUserModel> searchUserModelFromJson(String str) =>
    List<SearchUserModel>.from(
        json.decode(str).map((x) => SearchUserModel.fromJson(x)));

String searchUserModelToJson(List<SearchUserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class SearchUserModel with _$SearchUserModel {
  const factory SearchUserModel({
    @JsonKey(name: "_id") required String id,
    required String name,
    required String username,
    String? userProfileImage,
  }) = _SearchUserModel;

  factory SearchUserModel.fromJson(Map<String, dynamic> json) =>
      _$SearchUserModelFromJson(json);
}
