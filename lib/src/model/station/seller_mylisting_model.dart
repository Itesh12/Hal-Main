// To parse this JSON data, do
//
//     final sellerMylistingModel = sellerMylistingModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'seller_mylisting_model.freezed.dart';
part 'seller_mylisting_model.g.dart';

List<SellerMylistingModel> sellerMylistingModelFromJson(String str) =>
    List<SellerMylistingModel>.from(
        json.decode(str).map((x) => SellerMylistingModel.fromJson(x)));

String sellerMylistingModelToJson(List<SellerMylistingModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class SellerMylistingModel with _$SellerMylistingModel {
  const factory SellerMylistingModel({
    required String sellingProductId,
    required String serviceName,
    required String sellingStatus,
    required DateTime modifiedTime,
    @JsonKey(name: "_id") required String id,
  }) = _SellerMylistingModel;

  factory SellerMylistingModel.fromJson(Map<String, dynamic> json) =>
      _$SellerMylistingModelFromJson(json);
}
