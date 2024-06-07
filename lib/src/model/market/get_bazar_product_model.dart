import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kisaan_station/src/model/market/user_address_model.dart';
import 'package:kisaan_station/src/model/user/media_model.dart';

part 'get_bazar_product_model.freezed.dart';
part 'get_bazar_product_model.g.dart';

List<GetBazarProductModel> getBazarProductModelFromJson(String str) =>
    List<GetBazarProductModel>.from(
        json.decode(str).map((x) => GetBazarProductModel.fromJson(x)));

String getBazarProductModelToJson(List<GetBazarProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class GetBazarProductModel with _$GetBazarProductModel {
  const factory GetBazarProductModel({
    @JsonKey(name: "_id") required String id,
    required String userId,
    required String category,
    required String subCategory,
    required String brand,
    required int price,
     int? quantity,
     String? unit,
    String? description,
    List<Media>? media,
    required String trading,
    required String mobileNo,
    required double distance,
    required DateTime createdAt,
    required String traderName,
     String? status,
    String? rejReason,
    List<Address>? address,
  }) = _GetBazarProductModel;

  factory GetBazarProductModel.fromJson(Map<String, dynamic> json) =>
      _$GetBazarProductModelFromJson(json);
}
