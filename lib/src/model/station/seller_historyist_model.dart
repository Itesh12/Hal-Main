// To parse this JSON data, do
//
//     final sellerHistoryistModel = sellerHistoryistModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'seller_historyist_model.freezed.dart';
part 'seller_historyist_model.g.dart';

List<SellerHistoryistModel> sellerHistoryistModelFromJson(String str) =>
    List<SellerHistoryistModel>.from(
        json.decode(str).map((x) => SellerHistoryistModel.fromJson(x)));

String sellerHistoryistModelToJson(List<SellerHistoryistModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class SellerHistoryistModel with _$SellerHistoryistModel {
  const factory SellerHistoryistModel({
    required AddFarmLocation addFarmLocation,
    @JsonKey(name: "_id") required String id,
    required List<AddFarmDetail> addFarmDetails,
    required String cropType,
    required String sparyProduct,
    required String bookingId,
    required int estimatedPrice,
    required dynamic paymentReceived,
    required int remainingPayment,
    required DateTime updatedAt,
  }) = _SellerHistoryistModel;

  factory SellerHistoryistModel.fromJson(Map<String, dynamic> json) =>
      _$SellerHistoryistModelFromJson(json);
}

@freezed
abstract class AddFarmDetail with _$AddFarmDetail {
  const factory AddFarmDetail({
    required String farmName,
    required double area,
    required String areaUnit,
    @JsonKey(name: "_id") required String id,
  }) = _AddFarmDetail;

  factory AddFarmDetail.fromJson(Map<String, dynamic> json) =>
      _$AddFarmDetailFromJson(json);
}

@freezed
abstract class AddFarmLocation with _$AddFarmLocation {
  const factory AddFarmLocation({
    required String address,
  }) = _AddFarmLocation;

  factory AddFarmLocation.fromJson(Map<String, dynamic> json) =>
      _$AddFarmLocationFromJson(json);
}
