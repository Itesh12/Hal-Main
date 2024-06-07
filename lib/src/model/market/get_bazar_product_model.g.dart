// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_bazar_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetBazarProductModelImpl _$$GetBazarProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GetBazarProductModelImpl(
      id: json['_id'] as String,
      userId: json['userId'] as String,
      category: json['category'] as String,
      subCategory: json['subCategory'] as String,
      brand: json['brand'] as String,
      price: json['price'] as int,
      quantity: json['quantity'] as int?,
      unit: json['unit'] as String?,
      description: json['description'] as String?,
      media: (json['media'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      trading: json['trading'] as String,
      mobileNo: json['mobileNo'] as String,
      distance: (json['distance'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      traderName: json['traderName'] as String,
      status: json['status'] as String?,
      rejReason: json['rejReason'] as String?,
      address: (json['address'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetBazarProductModelImplToJson(
        _$GetBazarProductModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'category': instance.category,
      'subCategory': instance.subCategory,
      'brand': instance.brand,
      'price': instance.price,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'description': instance.description,
      'media': instance.media,
      'trading': instance.trading,
      'mobileNo': instance.mobileNo,
      'distance': instance.distance,
      'createdAt': instance.createdAt.toIso8601String(),
      'traderName': instance.traderName,
      'status': instance.status,
      'rejReason': instance.rejReason,
      'address': instance.address,
    };
