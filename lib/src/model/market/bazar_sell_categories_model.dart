import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'bazar_sell_categories_model.freezed.dart';
part 'bazar_sell_categories_model.g.dart';

List<BazarSellCategoryModel> bazarSellCategoryModelFromJson(String str) =>
    List<BazarSellCategoryModel>.from(
        json.decode(str).map((x) => BazarSellCategoryModel.fromJson(x)));



@freezed
abstract class BazarSellCategoryModel with _$BazarSellCategoryModel {
  const factory BazarSellCategoryModel({
    @JsonKey(name: "_id") required String id,
     String? name,
     String? title,
    String? icon,
    String? parent_id,
  }) = _BazarSellCategoryModel;

  factory BazarSellCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$BazarSellCategoryModelFromJson(json);
}
