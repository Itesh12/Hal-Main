// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      locationType: json['locationType'] as String,
      state: json['state'] as String,
      district: json['district'] as String,
      pinCode: json['pinCode'] as String,
      area: json['area'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'locationType': instance.locationType,
      'state': instance.state,
      'district': instance.district,
      'pinCode': instance.pinCode,
      'area': instance.area,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
