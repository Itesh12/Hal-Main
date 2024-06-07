// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_mylisting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SellerMylistingModelImpl _$$SellerMylistingModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SellerMylistingModelImpl(
      sellingProductId: json['sellingProductId'] as String,
      serviceName: json['serviceName'] as String,
      sellingStatus: json['sellingStatus'] as String,
      modifiedTime: DateTime.parse(json['modifiedTime'] as String),
      id: json['_id'] as String,
    );

Map<String, dynamic> _$$SellerMylistingModelImplToJson(
        _$SellerMylistingModelImpl instance) =>
    <String, dynamic>{
      'sellingProductId': instance.sellingProductId,
      'serviceName': instance.serviceName,
      'sellingStatus': instance.sellingStatus,
      'modifiedTime': instance.modifiedTime.toIso8601String(),
      '_id': instance.id,
    };
