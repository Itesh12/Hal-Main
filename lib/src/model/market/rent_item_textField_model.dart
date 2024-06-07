
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rent_item_textField_model.freezed.dart';
part 'rent_item_textField_model.g.dart';


@freezed
abstract class RentItemTextFieldModel with _$RentItemTextFieldModel {
  const factory RentItemTextFieldModel({
    required String userId,
    required  String category,
    String? subCategory,
    String? brand,
    required String price,
    String? description,

  }) = _RentItemTextFieldModel;

  factory RentItemTextFieldModel.fromJson(Map<String, dynamic> json) =>
      _$RentItemTextFieldModelFromJson(json);
}
