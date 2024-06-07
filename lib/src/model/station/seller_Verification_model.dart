// To parse this JSON data, do
//
//     final sellerVerificationModel = sellerVerificationModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'seller_Verification_model.freezed.dart';
part 'seller_Verification_model.g.dart';

List<SellerVerificationModel> sellerVerificationModelFromJson(String str) =>
    List<SellerVerificationModel>.from(
        json.decode(str).map((x) => SellerVerificationModel.fromJson(x)));

String sellerVerificationModelToJson(List<SellerVerificationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class SellerVerificationModel with _$SellerVerificationModel {
  const factory SellerVerificationModel({
    required String userId,
    required String fullName,
    required String email,
    required String businessDetails,
    required bool hasRegistered,
    required String sellerType,
    required String dcId,
    required String dcName,
    required String location,
    String? referralCode
  }) = _SellerVerificationModel;

  factory SellerVerificationModel.fromJson(Map<String, dynamic> json) =>
      _$SellerVerificationModelFromJson(json);
}



