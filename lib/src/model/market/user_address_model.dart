
import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_address_model.freezed.dart';
part 'user_address_model.g.dart';

UserAddressModel userAddressModelFromJson(String str) => UserAddressModel.fromJson(json.decode(str));

String userAddressModelToJson(UserAddressModel data) => json.encode(data.toJson());

@freezed
abstract class UserAddressModel with _$UserAddressModel {
  const factory UserAddressModel({
    @JsonKey(name: "_id") required String id,
    required List<Address> address,
  }) = _UserAddressModel;

  factory UserAddressModel.fromJson(Map<String, dynamic> json) => _$UserAddressModelFromJson(json);
}

@freezed
abstract class Address with _$Address {
  const factory Address({
    required String state,
    required String district,
    required String pinCode,
    required String area,
    required String locationType,
    required double latitude,
    required double longitude,
     String? wtsUpMobileNo,
    @JsonKey(name: "_id") required String id,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}
