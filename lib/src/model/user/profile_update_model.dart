import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_update_model.freezed.dart';

part 'profile_update_model.g.dart';

ProfileUpdateModel profileUpdateModelFromJson(String str) => ProfileUpdateModel.fromJson(json.decode(str));

String profileUpdateModelToJson(ProfileUpdateModel data) => json.encode(data.toJson());


@freezed
class ProfileUpdateRepoModel with _$ProfileUpdateRepoModel {
  const factory ProfileUpdateRepoModel({required String userId,
    String? name,
    String? username,
    String? referralCode,
    String? description,
    String? email,
    String? state,
    String? district,
    String? pinCode,
    String? area,
    double? latitude,
    double? longitude,
    bool? keepImage,
  }) = _ProfileUpdateRepoModel;

  const ProfileUpdateRepoModel._();

  factory ProfileUpdateRepoModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateRepoModelFromJson(json);
}




@freezed
abstract class ProfileUpdateModel with _$ProfileUpdateModel {
  const factory ProfileUpdateModel({
    required List<UpdatedUser> user,
  }) = _ProfileUpdateModel;

  factory ProfileUpdateModel.fromJson(Map<String, dynamic> json) => _$ProfileUpdateModelFromJson(json);
}

@freezed
abstract class UpdatedUser with _$UpdatedUser {
  const factory UpdatedUser({
    required String user_id,
    required String name,
     String? profilePic,
    String? description,
     int? followers_count,
    int? following_count,
     Address? address,
  }) = _UpdatedUser;

  factory UpdatedUser.fromJson(Map<String, dynamic> json) => _$UpdatedUserFromJson(json);
}

@freezed
abstract class Address with _$Address {
  const factory Address({
     String? state,
     String? district,
     String? pinCode,
    String? area,
    double? latitude,
     double? longitude,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}




// @freezed
// class ProfileUpdateModel with _$ProfileUpdateModel {
//   const factory ProfileUpdateModel(required UpdateUserModel user}) =
//       _ProfileUpdateModel;
//
//   const ProfileUpdateModel._();
//
//   factory ProfileUpdateModel.fromJson(Map<String, dynamic> json) =>
//       _$ProfileUpdateModelFromJson(json);
// }
//
// @freezed
// class UpdateUserModel with _$UpdateUserModel {
//   const factory UpdateUserModel({
//      String? name,
//     String? profilePic,
//     String? description,
//   }) = _UpdateUserModel;
//
//   const UpdateUserModel._();
//
//   factory UpdateUserModel.fromJson(Map<String, dynamic> json) =>
//       _$UpdateUserModelFromJson(json);
// }
