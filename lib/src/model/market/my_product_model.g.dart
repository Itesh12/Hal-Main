// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetMyProductModelImpl _$$GetMyProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GetMyProductModelImpl(
      id: json['_id'] as String,
      userId: json['userId'] as String,
      category: json['category'] as String,
      subCategory: json['subCategory'] as String,
      brand: json['brand'] as String,
      price: json['price'] as int,
      description: json['description'] as String?,
      media: (json['media'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      trading: json['trading'] as String,
      mobileNo: json['mobileNo'] as String,
      distance: (json['distance'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      traderName: json['traderName'] as String,
      address: (json['address'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetMyProductModelImplToJson(
        _$GetMyProductModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'category': instance.category,
      'subCategory': instance.subCategory,
      'brand': instance.brand,
      'price': instance.price,
      'description': instance.description,
      'media': instance.media,
      'trading': instance.trading,
      'mobileNo': instance.mobileNo,
      'distance': instance.distance,
      'createdAt': instance.createdAt.toIso8601String(),
      'traderName': instance.traderName,
      'address': instance.address,
    };
