// To parse this JSON data, do
//
//     final droneServiceModel = droneServiceModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'drone_service_model.freezed.dart';
part 'drone_service_model.g.dart';

List<DroneServiceModel> droneServiceModelFromJson(String str) =>
    List<DroneServiceModel>.from(
        json.decode(str).map((x) => DroneServiceModel.fromJson(x)));

String droneServiceModelToJson(List<DroneServiceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class DroneServiceModel with _$DroneServiceModel {
  const factory DroneServiceModel({
    required AddFarmLocation addFarmLocation,
    @JsonKey(name: "_id") required String id,
    required String reqUserId,
    required String stationId,
    required String serviceName,
    required String name,
    required String mobileNo,
    required String bookingDate,
    required String bookingStartTime,
    required List<AddFarmDetail> addFarmDetails,
    required String cropType,
    required String sparyProduct,
    required String bookingId,
    required String orderStatus,
    required double estimatedPrice,
    required int paymentReceived,
    required int remainingPayment,
    String? sellerName,
    String? sellerContactNo,
    String? remarks,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _DroneServiceModel;

  factory DroneServiceModel.fromJson(Map<String, dynamic> json) =>
      _$DroneServiceModelFromJson(json);
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
    required String latitude,
    required String longitude,
    required String address,
  }) = _AddFarmLocation;

  factory AddFarmLocation.fromJson(Map<String, dynamic> json) =>
      _$AddFarmLocationFromJson(json);
}

@freezed
abstract class SparyProduct with _$SparyProduct {
  const factory SparyProduct({
    required String productName,
    required int productPrice,
    required int quantity,
    required String qtyUnit,
    @JsonKey(name: "_id") required String id,
  }) = _SparyProduct;

  factory SparyProduct.fromJson(Map<String, dynamic> json) =>
      _$SparyProductFromJson(json);
}
