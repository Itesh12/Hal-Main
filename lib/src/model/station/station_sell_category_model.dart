import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'station_sell_category_model.freezed.dart';
part 'station_sell_category_model.g.dart';

List<StationSellCategoryModel> stationSellCategoryModelFromJson(String str) =>
    List<StationSellCategoryModel>.from(
        json.decode(str).map((x) => StationSellCategoryModel.fromJson(x)));



@freezed
abstract class StationSellCategoryModel with _$StationSellCategoryModel {
  const factory StationSellCategoryModel({
    @JsonKey(name: "_id") required String id,
    String? title,
    String? image,
    String? parentId,
    String? trading,
    String? source,
  }) = _StationSellCategoryModel;

  factory StationSellCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$StationSellCategoryModelFromJson(json);
}
