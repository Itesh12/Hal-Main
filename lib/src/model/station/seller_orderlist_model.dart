// To parse this JSON data, do
//
//     final sellerOrderlistModel = sellerOrderlistModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'seller_orderlist_model.freezed.dart';
part 'seller_orderlist_model.g.dart';

List<SellerOrderlistModel> sellerOrderlistModelFromJson(String str) =>
    List<SellerOrderlistModel>.from(
        json.decode(str).map((x) => SellerOrderlistModel.fromJson(x)));

String sellerOrderlistModelToJson(List<SellerOrderlistModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class SellerOrderlistModel with _$SellerOrderlistModel {
  const factory SellerOrderlistModel({
    @JsonKey(name: "_id") required String id,
    required String buyerName,
    required String bookingId,
    required String serviceName,
    required double estimatedPrice,
    required FarmLocation farmLocation,
    required String bookingDate,
    required String bookingTime,
    required List<FarmDetail> farmDetails,
    required String cropType,
    required String sparyProduct,
    required String mobileNo,
    required String orderStatus,
    String? buyerProfileImage,
  }) = _SellerOrderlistModel;

  factory SellerOrderlistModel.fromJson(Map<String, dynamic> json) =>
      _$SellerOrderlistModelFromJson(json);
}

@freezed
abstract class FarmDetail with _$FarmDetail {
  const factory FarmDetail({
    required String farmName,
    required double area,
    required String areaUnit,
    @JsonKey(name: "_id") required String id,
  }) = _FarmDetail;

  factory FarmDetail.fromJson(Map<String, dynamic> json) =>
      _$FarmDetailFromJson(json);
}

@freezed
abstract class FarmLocation with _$FarmLocation {
  const factory FarmLocation({
    required String latitude,
    required String longitude,
    required String address,
  }) = _FarmLocation;

  factory FarmLocation.fromJson(Map<String, dynamic> json) =>
      _$FarmLocationFromJson(json);
}
