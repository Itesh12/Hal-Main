// To parse this JSON data, do
//
//     final orderDeliverdModel = orderDeliverdModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_deliver_model.freezed.dart';
part 'order_deliver_model.g.dart';

List<OrderDeliverdModel> orderDeliverdModelFromJson(String str) =>
    List<OrderDeliverdModel>.from(
        json.decode(str).map((x) => OrderDeliverdModel.fromJson(x)));

String orderDeliverdModelToJson(List<OrderDeliverdModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class OrderDeliverdModel with _$OrderDeliverdModel {
  const factory OrderDeliverdModel({
    @JsonKey(name: "buyId") String? id,
    required String estimatedPrice,
    required String paymentReceived,
    required String remainingPayment,
    required String OCLocation,
    required String addFarmDetails,
    required String equipmentNo,
    String? remarks,
  }) = _OrderDeliverdModel;

  factory OrderDeliverdModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDeliverdModelFromJson(json);
}

@freezed
abstract class FarmDetailOrder with _$FarmDetailOrder {
  const factory FarmDetailOrder({
    required String farmName,
    required double area,
    required String areaUnit,
  }) = _FarmDetailOrder;

  factory FarmDetailOrder.fromJson(Map<String, dynamic> json) =>
      _$FarmDetailOrderFromJson(json);
}

@freezed
abstract class OcLocation with _$OcLocation {
  const factory OcLocation({
    required String address,
    required String latitude,
    required String longitude,
  }) = _OcLocation;

  factory OcLocation.fromJson(Map<String, dynamic> json) =>
      _$OcLocationFromJson(json);
}
