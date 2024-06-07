// To parse this JSON data, do
//
//     final sellerServiceUploadModel = sellerServiceUploadModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'seller_service_upload_model.freezed.dart';
part 'seller_service_upload_model.g.dart';

List<SellerServiceUploadModel> sellerServiceUploadModelFromJson(String str) =>
    List<SellerServiceUploadModel>.from(
        json.decode(str).map((x) => SellerServiceUploadModel.fromJson(x)));

String sellerServiceUploadModelToJson(List<SellerServiceUploadModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class SellerServiceUploadModel with _$SellerServiceUploadModel {
  const factory SellerServiceUploadModel({
    required String sellerId,
    required List<String> kisaanStations,
    required String droneRegNo,
    required String description,
  }) = _SellerServiceUploadModel;

  factory SellerServiceUploadModel.fromJson(Map<String, dynamic> json) =>
      _$SellerServiceUploadModelFromJson(json);
}
