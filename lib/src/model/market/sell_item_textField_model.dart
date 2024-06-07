
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sell_item_textField_model.freezed.dart';
part 'sell_item_textField_model.g.dart';


@freezed
abstract class SellItemTextFieldModel with _$SellItemTextFieldModel {
  const factory SellItemTextFieldModel({
    required String userId,
    required  String category,
    String? subCategory,
    String? variety,
    String? brand,
    required String price,
    required String quantity,
    required String Qty_unit,
    String? description,

  }) = _SellItemTextFieldModel;

  factory SellItemTextFieldModel.fromJson(Map<String, dynamic> json) =>
      _$SellItemTextFieldModelFromJson(json);
}
