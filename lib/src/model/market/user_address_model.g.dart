// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAddressModelImpl _$$UserAddressModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAddressModelImpl(
      id: json['_id'] as String,
      address: (json['address'] as List<dynamic>)
          .map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserAddressModelImplToJson(
        _$UserAddressModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'address': instance.address,
    };

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      state: json['state'] as String,
      district: json['district'] as String,
      pinCode: json['pinCode'] as String,
      area: json['area'] as String,
      locationType: json['locationType'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      wtsUpMobileNo: json['wtsUpMobileNo'] as String?,
      id: json['_id'] as String,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'district': instance.district,
      'pinCode': instance.pinCode,
      'area': instance.area,
      'locationType': instance.locationType,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'wtsUpMobileNo': instance.wtsUpMobileNo,
      '_id': instance.id,
    };
