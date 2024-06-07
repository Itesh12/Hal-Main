
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bazar_sell_post_model.freezed.dart';
part 'bazar_sell_post_model.g.dart';


@freezed
abstract class BazarSellPostModel with _$BazarSellPostModel {
  const factory BazarSellPostModel({
  required String userId,
    required  String category,
    String? subCategory,
    String? variety,
    String? brand,
    required String price,
     String? quantity,
     String? wtsUpMobileNo,
     String? Qty_unit,
    String? description,
    required double latitude,
    required double longitude,
    required String trading,

  }) = _BazarSellPostModel;

  factory BazarSellPostModel.fromJson(Map<String, dynamic> json) =>
      _$BazarSellPostModelFromJson(json);
}
