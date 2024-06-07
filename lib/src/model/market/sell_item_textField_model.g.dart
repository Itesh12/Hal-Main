// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_item_textField_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SellItemTextFieldModelImpl _$$SellItemTextFieldModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SellItemTextFieldModelImpl(
      userId: json['userId'] as String,
      category: json['category'] as String,
      subCategory: json['subCategory'] as String?,
      variety: json['variety'] as String?,
      brand: json['brand'] as String?,
      price: json['price'] as String,
      quantity: json['quantity'] as String,
      Qty_unit: json['Qty_unit'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$SellItemTextFieldModelImplToJson(
        _$SellItemTextFieldModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'category': instance.category,
      'subCategory': instance.subCategory,
      'variety': instance.variety,
      'brand': instance.brand,
      'price': instance.price,
      'quantity': instance.quantity,
      'Qty_unit': instance.Qty_unit,
      'description': instance.description,
    };
