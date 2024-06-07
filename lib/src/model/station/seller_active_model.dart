// To parse this JSON data, do
//
//     final sellerActiveModel = sellerActiveModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'seller_active_model.freezed.dart';
part 'seller_active_model.g.dart';

List<SellerActiveModel> sellerActiveModelFromJson(String str) =>
    List<SellerActiveModel>.from(
        json.decode(str).map((x) => SellerActiveModel.fromJson(x)));

String sellerActiveModelToJson(List<SellerActiveModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class SellerActiveModel with _$SellerActiveModel {
  const factory SellerActiveModel({
    required String sellerId,
    required String status,
  }) = _SellerActiveModel;

  factory SellerActiveModel.fromJson(Map<String, dynamic> json) =>
      _$SellerActiveModelFromJson(json);
}
