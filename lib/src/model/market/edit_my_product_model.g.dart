// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_my_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditMyProductModelImpl _$$EditMyProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EditMyProductModelImpl(
      userId: json['userId'] as String,
      productId: json['productId'] as String,
      category: json['category'] as String?,
      subCategory: json['subCategory'] as String?,
      variety: json['variety'] as String?,
      brand: json['brand'] as String?,
      price: json['price'] as String?,
      quantity: json['quantity'] as String?,
      wtsUpMobileNo: json['wtsUpMobileNo'] as String?,
      Qty_unit: json['Qty_unit'] as String?,
      description: json['description'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      trading: json['trading'] as String?,
    );

Map<String, dynamic> _$$EditMyProductModelImplToJson(
        _$EditMyProductModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'productId': instance.productId,
      'category': instance.category,
      'subCategory': instance.subCategory,
      'variety': instance.variety,
      'brand': instance.brand,
      'price': instance.price,
      'quantity': instance.quantity,
      'wtsUpMobileNo': instance.wtsUpMobileNo,
      'Qty_unit': instance.Qty_unit,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'trading': instance.trading,
    };
