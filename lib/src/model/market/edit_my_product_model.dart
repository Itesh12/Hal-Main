
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_my_product_model.freezed.dart';
part 'edit_my_product_model.g.dart';


@freezed
abstract class EditMyProductModel with _$EditMyProductModel {
  const factory EditMyProductModel({
    required String userId,
 required String productId,
      String? category,
    String? subCategory,
    String? variety,
    String? brand,
     String? price,
    String? quantity,
    String? wtsUpMobileNo,
    String? Qty_unit,
    String? description,
     double? latitude,
     double? longitude,
     String? trading,

  }) = _EditMyProductModel;

  factory EditMyProductModel.fromJson(Map<String, dynamic> json) =>
      _$EditMyProductModelFromJson(json);
}
