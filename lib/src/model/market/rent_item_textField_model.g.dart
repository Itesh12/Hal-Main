// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_item_textField_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RentItemTextFieldModelImpl _$$RentItemTextFieldModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RentItemTextFieldModelImpl(
      userId: json['userId'] as String,
      category: json['category'] as String,
      subCategory: json['subCategory'] as String?,
      brand: json['brand'] as String?,
      price: json['price'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$RentItemTextFieldModelImplToJson(
        _$RentItemTextFieldModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'category': instance.category,
      'subCategory': instance.subCategory,
      'brand': instance.brand,
      'price': instance.price,
      'description': instance.description,
    };
