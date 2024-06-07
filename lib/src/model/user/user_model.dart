// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'address_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

@freezed
abstract class User with _$User {
  const factory User({
    required String name,
    required String username,
    required String referralCode,
    required String mobileNo,
    String? profilePic,
    required Address address,
    String? description,
    @JsonKey(name: "followers_count") required int followersCount,
    @JsonKey(name: "following_count") required int followingCount,
    @JsonKey(name: "following_status") required bool followingStatus,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
