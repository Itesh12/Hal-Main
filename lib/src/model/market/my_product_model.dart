
import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kisaan_station/src/model/market/user_address_model.dart';
import 'package:kisaan_station/src/model/user/media_model.dart';

part 'my_product_model.freezed.dart';
part 'my_product_model.g.dart';

List<GetMyProductModel> getBazarProductModelFromJson(String str) => List<GetMyProductModel>.from(json.decode(str).map((x) => GetMyProductModel.fromJson(x)));

String getBazarProductModelToJson(List<GetMyProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class GetMyProductModel with _$GetMyProductModel {
  const factory GetMyProductModel({
    @JsonKey(name: "_id") required String id,
    required String userId,
    required String category,
    required String subCategory,
    required String brand,
    required int price,
    String? description,
    List<Media>? media,
    required String trading,
    required String mobileNo,
    required double distance,
    required DateTime createdAt,
    required String traderName,
    List<Address>? address,
  }) = _GetMyProductModel;

  factory GetMyProductModel.fromJson(Map<String, dynamic> json) => _$GetMyProductModelFromJson(json);
}
