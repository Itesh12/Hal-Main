// To parse this JSON data, do
//
//     final sellerDashboardModel = sellerDashboardModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'seller_dashboard_model.freezed.dart';
part 'seller_dashboard_model.g.dart';

List<SellerDashboardModel> sellerDashboardModelFromJson(String str) =>
    List<SellerDashboardModel>.from(
        json.decode(str).map((x) => SellerDashboardModel.fromJson(x)));

String sellerDashboardModelToJson(List<SellerDashboardModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class SellerDashboardModel with _$SellerDashboardModel {
  const factory SellerDashboardModel({
    required double TotalPaymentReceived,
    required double TotalRemainingPayment,
    required int TotalOrders,
    required double TotalAreaCovered,
    required int TotalPending,
    required int TotalDelivered,
    required int TotalCancelled,
    required int TotalListings,
  }) = _SellerDashboardModel;

  factory SellerDashboardModel.fromJson(Map<String, dynamic> json) =>
      _$SellerDashboardModelFromJson(json);
}
