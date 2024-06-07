// To parse this JSON data, do
//
//     final productListinginactiveModel = productListinginactiveModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_listinginactive_model.freezed.dart';
part 'product_listinginactive_model.g.dart';

List<ProductListinginactiveModel> productListinginactiveModelFromJson(
        String str) =>
    List<ProductListinginactiveModel>.from(
        json.decode(str).map((x) => ProductListinginactiveModel.fromJson(x)));

String productListinginactiveModelToJson(
        List<ProductListinginactiveModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class ProductListinginactiveModel with _$ProductListinginactiveModel {
  const factory ProductListinginactiveModel({
    required String sellerId,
    required String productId,
    required String status,
  }) = _ProductListinginactiveModel;

  factory ProductListinginactiveModel.fromJson(Map<String, dynamic> json) =>
      _$ProductListinginactiveModelFromJson(json);
}
