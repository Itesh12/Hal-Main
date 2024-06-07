// To parse this JSON data, do
//
//     final sellerStatusModel = sellerStatusModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'seller_status_model.freezed.dart';
part 'seller_status_model.g.dart';

List<SellerStatusModel> sellerStatusModelFromJson(String str) =>
    List<SellerStatusModel>.from(
        json.decode(str).map((x) => SellerStatusModel.fromJson(x)));

String sellerStatusModelToJson(List<SellerStatusModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class SellerStatusModel with _$SellerStatusModel {
  const factory SellerStatusModel({
    @JsonKey(name: "_id") required String id,
    required String userId,
    required String fullName,
    required String email,
    required String businessDetails,
    required List<Document> documents,
    required bool hasRegistered,
    @JsonKey(name: "SPID") required String spid,
    required String status,
    required String sellerStatus,
    String? sellerType,
    String? rejectReason,
    String? inActiveReason,
    // required DateTime createdAt,
    // required DateTime updatedAt,
  }) = _SellerStatusModel;

  factory SellerStatusModel.fromJson(Map<String, dynamic> json) =>
      _$SellerStatusModelFromJson(json);
}

@freezed
abstract class Document with _$Document {
  const factory Document({
    required String mediaUrl,
  }) = _Document;

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);
}
