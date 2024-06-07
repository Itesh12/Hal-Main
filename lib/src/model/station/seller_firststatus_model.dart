// To parse this JSON data, do
//
//     final sellerFirststatusModel = sellerFirststatusModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'seller_firststatus_model.freezed.dart';
part 'seller_firststatus_model.g.dart';

List<SellerFirststatusModel> sellerFirststatusModelFromJson(String str) =>
    List<SellerFirststatusModel>.from(
        json.decode(str).map((x) => SellerFirststatusModel.fromJson(x)));

String sellerFirststatusModelToJson(List<SellerFirststatusModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class SellerFirststatusModel with _$SellerFirststatusModel {
  const factory SellerFirststatusModel({
    required bool status,
  }) = _SellerFirststatusModel;

  factory SellerFirststatusModel.fromJson(Map<String, dynamic> json) =>
      _$SellerFirststatusModelFromJson(json);
}
